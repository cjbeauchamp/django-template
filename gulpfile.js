'use strict';

var root_dir = "./myappname/static"

var gulp = require('gulp');
var sass = require('gulp-sass');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

gulp.task('sass', function() {
  return gulp.src(root_dir + '/sass/*.scss')
    .pipe(concat('main.css'))
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest(root_dir));
});

gulp.task('sass:watch', function() {
  gulp.watch([root_dir + '/sass/**/*.scss'], ['sass']);
});

gulp.task('js', function() {
  return gulp.src(root_dir + '/js/*.js')
    .pipe(concat('main.js'))
    .pipe(gulp.dest(root_dir));
});

gulp.task('js:watch', function() {
  gulp.watch([root_dir + '/js/*.js'], ['js']);
});

gulp.task('compile', ['js', 'sass']);
gulp.task('watch', ['js:watch', 'sass:watch']);