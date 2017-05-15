'use strict';

// REQUISITES

var
gulp		= require('gulp'),
watch		= require('gulp-watch'),
sass		= require('gulp-sass'),
minify      = require('gulp-minify-css'),
uglify		= require('gulp-uglify'),
concat		= require('gulp-concat'),
gulpif      = require('gulp-if')
;

// PATHS

var
CSS			= 'sass/',
JS 			= 'js/'
;

// BUILD VARIABLES

var ugly 		= false;

// TASKS

gulp.task('default', ['css', 'js'], function(){
	gulp.watch(CSS + '**/*.scss', ['css']);
	gulp.watch(JS + '*.js', ['js']);
})

gulp.task('js', function() {
	var FILES = [
		JS + '*.js'
	];
	gulp.src(FILES)
		.pipe(concat('main.js'))
		.pipe(uglify())
		.pipe(gulp.dest('../Scripts'))
})

gulp.task('css', function() {
	var FILES = [
		CSS + '*.scss'
	];
	gulp.src(FILES)
	    .pipe(sass({ errLogToConsole: true }))
	    .pipe(gulpif(ugly, minify().on('error', function (error) { console.warn(error.message); })))
		.pipe(sass())
			.on('error', sass.logError)
		.pipe(gulp.dest('../Styles'))
})