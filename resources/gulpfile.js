"use strict";

var gulp = require('gulp'),
    less = require('gulp-less'),
    cssnano = require('gulp-cssnano'),
    clean = require('gulp-clean'),
    livereload = require('gulp-livereload'),
    http = require('http'),
    st = require('st'),
    exec = require('gulp-exec'),
    paths,
    watchers,
    less2css;


paths = {
  root: './',
  less: ['assets/less/style.less', 'assets/less/reset.less', 'assets/less/vendor.less'],
  style: ['assets/less/style.less', 'assets/less/reset.less'],
  images: 'src/images',
  css: 'dist/css',
  dist: 'dist',
  src: 'src',
};

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

watchers = [
  {
    paths: paths.style,
    executor: function () {
      return less2css(paths.style);
    }
  },
  {
    paths: [
      'assets/less/vendor.less',
      'assets/less/variables.less',
      'assets/less/vendor/*.less'],
    executor: function () {
      return less2css(['assets/less/vendor.less']);
    }
  },
];


//清空dist文件夹
gulp.task('clean', function() {
  return gulp.src('dist/*', {
    read: false
    })
    .pipe(clean());
});


//复制图片文件到dist目录
gulp.task('images', function() {
  return gulp.src(paths.images)
    .pipe(gulp.dest(paths.dist));
});

//less编译成css
gulp.task('less', function () {
  return less2css(paths.less);
});

//监听less文件改动  自动编译成css
gulp.task('watch', ['clean'], function() {
  livereload.listen({
    quiet: true
  });

  gulp.start('less', 'server');

  gulp.src(paths.src)
    .pipe(
      exec([
        "ln -s ../src/js dist/"
      ])
    )
    .pipe(
      exec([
        "ln -s ../src/images dist/"
      ])
    );

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
gulp.task('default', function(){
  gulp.start('clean', 'images','less');
});
