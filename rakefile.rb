def run(command)
  IO.popen(command){ |process| process.each { |line| puts line } }
end
desc "compile versions for different hosting companies"
task :compile do
  STD = "/usr/local/lib/mtasc/std"
  STD8 = "/usr/local/lib/mtasc/std8"
  file = "336x280_3D"
  injected = "src/IDG.as"
  command = "mtasc -v -keep -main -version 8 -cp src -cp #{STD} -cp #{STD8} -swf fla/#{file}.swf -out bin/#{file}.out.swf #{injected} "
  run command
end