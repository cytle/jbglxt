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
    distPath,
    needLessWhenProducting,
    copyOrLinkToDist;

rootPath = fs.realpathSync('.') + '/resources/';
assetsPath = rootPath + 'assets/';
distPath = rootPath + '../wwwroot/Public/Home/hdz/';

paths = {
  root: rootPath,
  less: assetsPath + 'less/',
  images: assetsPath + 'images/',
  js: assetsPath + 'js/',
  html: rootPath + 'html/',
  static: rootPath + 'static/',
  css: distPath + 'css/',
  dist: distPath,
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

copyOrLinkToDist = function (type) {

  var resources = [paths.js, paths.images, paths.html, paths.root + 'static/'],
      commonds = {
        copy: 'cp -rf <%= file.path %> <%= options.dist %>',
        link: 'ln -s <%= file.path %> <%= options.dist %>',
      };

  gulp.src(resources, {
      read: false
    })
    .pipe(exec(commonds[type], {
      dist: paths.dist
    }));
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

gulp.task('copy', function() {

  copyOrLinkToDist('copy');

});

// less编译成css
gulp.task('less', function () {
  return less2css(needLessWhenProducting);
});

// 监听less文件改动  自动编译成css
gulp.task('watch', ['init'], function() {
  livereload.listen({
    // quiet: true
  });

  gulp.start('less', 'server');

  // 链接
  copyOrLinkToDist('link');

  // 添加监听
  for (var i = watchers.length - 1; i >= 0; i--) {
    gulp.watch(watchers[i].paths, watchers[i].executor);
  }

});


// 开始服务
gulp.task('server', function(done) {
  http.createServer(
    st({ path: distPath , index: 'html/index.html', cache: false })
  ).listen(8100, done);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['init'], function(){
  gulp.start('copy', 'less');
});
