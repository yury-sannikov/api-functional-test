gulp = require 'gulp'
argv = require 'yargs'
  .argv
exec = require 'child_process'
fs = require 'fs'
run = require 'gulp-run'
vows = require 'gulp-vows'
coffee = require 'gulp-coffee'
wait = require 'gulp-wait'
concat = require 'gulp-concat'

iisPort = 8088
apiRoot = argv.path
console.log "API Root is #{apiRoot}"

winBin = process.env['ProgramFiles(x86)'] ? process.env.ProgramFiles
console.log "bin root is #{winBin}"

iisPath = "#{winBin}/IIS Express/iisexpress.exe"

throw "Unable to find IIS using path #{iisPath}" if not fs.existsSync iisPath

gulp.task 'default', ['cleanup'], () ->

gulp.task 'cleanup', ['executeTests'], () ->
  console.log "Stopping IIS Express"
  ###exec.exec 'taskkill /F /IM iisexpress* /T', (err, stdout, stderr) ->
    console.log stdout
  .stdin.end()
###

gulp.task 'startIIS', () ->
  out = fs.openSync './out.log', 'a'
  err = fs.openSync './out.log', 'a'
  terminal = exec.spawn iisPath, ["/port:#{iisPort}", "/path:#{apiRoot}"],
    detached: true
    stdio: [ 'ignore', out, err ]
  terminal.unref()
  console.log 'Check out.log for details'

gulp.task 'makeFixtures', () ->
  gulp.src ['fixtures/**/*.coffee']
    .pipe coffee
      bare: true
    .pipe gulp.dest 'dist'

testFiles = ['startup_spec.coffee', 'specs/**/*.spec.coffee']
gulp.task 'executeTests', ['startIIS', 'makeFixtures'], () ->
  gulp.src testFiles
    .pipe wait 1000
    .pipe coffee
      bare: true
    .pipe concat 'all.js'
    .pipe gulp.dest 'dist'
    .pipe vows
      reporter: 'spec'
    .pipe wait 3000

gulp.task 'executeTestsWatch', ['makeFixtures'], () ->
  gulp.src testFiles
    .pipe coffee
      bare: true
    .pipe concat 'all.js'
    .pipe gulp.dest 'dist'
    .pipe vows
      reporter: 'spec'

gulp.task 'watch', ['startIIS', 'executeTestsWatch'], () ->
  gulp.watch '**/*.coffee', ['executeTestsWatch']
