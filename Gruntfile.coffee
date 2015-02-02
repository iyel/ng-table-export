path = require 'path'

# Build configurations.
module.exports = (grunt) ->
    grunt.initConfig
        cmpnt: grunt.file.readJSON('bower.json'),
        banner: '/*! ngTableExport v<%= cmpnt.version %> by iyel (https://github.com/iyel/) - ' +
                    'https://github.com/iyel/ng-table-export - New BSD License */\n',
            
        # Deletes built file and temp directories.
        clean:
            working:
                src: [
                    'ng-table.*'
                    './.temp/views'
                    './.temp/'
                ]

        uglify:
            # concat js files before minification
            js:
                src: ['./dist/ng-table-export.js']
                dest: './dist/ng-table-export.min.js'
                options:
                  banner: '<%= banner %>'
                  sourceMap: (fileName) ->
                    fileName +='.map'
        concat:
            # concat js files before minification
            js:
                src: [
                    'src/scripts/*.js'
                ]
                dest: './dist/ng-table-export.js'

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-concat'

    grunt.registerTask 'dev', [
        'clean'
        'concat'
    ]
    grunt.registerTask 'default', [
        'dev'
        'uglify'
    ]
