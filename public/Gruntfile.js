module.exports = function(grunt)
{
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),

		sass: {
			dist: {
				options: {
					style: 'expanded',
					sourcemap: 'none',
					loadPath: 'C:\\wamp\\www\\hydro-css\\scss\\'
				},
				files: {
					'styles/app.css' : 'styles/src/main.scss'
				}
			}
		},

		autoprefixer: {
			options: {
				browsers: ['last 2 versions', 'ie 10', 'ie 9']
			},
			multiple_files: {
				expand: true,
				flatten: true,
				src: 'styles/app.css',
				dest: 'styles/'
			}
		},

		cssmin: {
			options: {
				advanced: false,
				aggressiveMerging: false,
				mediaMerging: false,
				restructuring: false,
				sourceMap: true
			},
			target: {
				files: {
					'styles/app.min.css' : 'styles/app.css'
				}
			}
		},

		requirejs: {
			compile: {
				options: {
					baseUrl: 'scripts/src/',
					keepBuildDir: true,
					name: 'libs/almond',
					include: ['main', 'libs/vue', 'libs/jquery'],
					out: 'scripts/app.js',
					skipModuleInsertion: true,
					preserveLicenseComments: true,
					optimize: 'none',
					wrap: {
						startFile: 'scripts/src/start.frag',
						endFile: 'scripts/src/end.frag'
					}
				}
			}
		},

		uglify: {
			options: {
				sourceMap: true,
				banner: '/*! <%= pkg.name %> <%= pkg.version %> */'
			},
			my_target: {
				files: {
					'scripts/app.min.js' : 'scripts/app.js'
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-autoprefixer');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-requirejs');
	grunt.loadNpmTasks('grunt-contrib-uglify');

	grunt.registerTask('css', ['sass', 'autoprefixer', 'cssmin']);
	grunt.registerTask('js', ['requirejs', 'uglify']);
};