"use strict";

var gulp = require('gulp'),
    less = require('gulp-less'),
    cssnano = require('gulp-cssnano'),
    clean = require('gulp-clean'),
    livereload = require('gulp-livereload'),
    fs = require('fs'),
    http = require('http'),
    st = require('st'),
    exec = require('gulp-exec'),
    paths,
    watchers,
    less2css,
    rootPath,
    assetsPath,
    needLessWhenProducting;

rootPath = fs.realpathSync('.') + '/';
assetsPath = rootPath + 'assets/';


paths = {
  root: rootPath,
  less: assetsPath + 'less/',
  images: assetsPath + 'images/',
  js: assetsPath + 'js/',
  css: rootPath + 'dist/css/',
  dist: rootPath + 'dist/',
};

needLessWhenProducting = [paths.less + 'style.less', paths.less + 'vendor.less'];


// 监听配置
watchers = [
  {
    paths: [
      paths.less + 'style.less',
      paths.less + 'style/*.less'],
    executor: function () {
      return less2css([paths.less + 'style.less']);
    }
  },
  {
    paths: [
      paths.less + 'vendor.less',
      paths.less + 'variables.less',
      paths.less + 'vendor/*.less'],
    executor: function () {
      return less2css([paths.less + 'vendor.less']);
    }
  },
  {
    paths: [
      rootPath + 'html/*'],
    executor: function (event) {
      gulp.src(event.path)
        .pipe(livereload());
    }
  },
];


less2css = function(path) {

  return gulp.src(path)
    .pipe(less())
    .on('error', function (error) {
        console.log(error.message);
        this.emit('end');
      })
    .pipe(cssnano())
    .pipe(gulp.dest(paths.css))
    .pipe(livereload());
};

// 初始化
gulp.task('init', ['clean'], function () {

  // 创建dist文件夹
  gulp.src([paths.root])
    .pipe(exec("mkdir -p " + paths.dist));
});


// 清空dist文件夹
gulp.task('clean', function() {
  return gulp.src(paths.dist, {
    read: false
    })
    .pipe(clean());
});


// 复制图片文件到dist目录
gulp.task('images', function() {
  return gulp.src(paths.images)
    .pipe(gulp.dest(paths.dist));
});

//复制js文件到dist目录
gulp.task('js', function() {
  return gulp.src(paths.js)
    .pipe(gulp.dest(paths.dist));
});

//less编译成css
gulp.task('less', function () {
  return less2css(needLessWhenProducting);
});

//监听less文件改动  自动编译成css
gulp.task('watch', ['init'], function() {
  livereload.listen({
    // quiet: true
  });

  gulp.start('less', 'server');

  // 链接js和images
  gulp.src([paths.js, paths.images], {
    read: false
    })
    .pipe(exec("ln -s <%= file.path %> <%= options.dist %>", {
      dist: paths.dist
    }));

  // 添加监听
  for (var i = watchers.length - 1; i >= 0; i--) {
    gulp.watch(watchers[i].paths, watchers[i].executor);
  }

});


// 开始服务
gulp.task('server', function(done) {
  http.createServer(
    st({ path: __dirname , index: 'html/index.html', cache: false })
  ).listen(8100, done);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['init'], function(){
  gulp.start('images', 'js','less');
});
