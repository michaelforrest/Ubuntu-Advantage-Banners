def run(command)
  IO.popen(command){ |process| process.each { |line| puts line } }
end
desc "compile versions for different hosting companies"
task :compile do
  STD = "/usr/local/lib/mtasc/std"
  STD8 = "/usr/local/lib/mtasc/std8"
  
  ["336x280_3D", "160x600_3D","728x90_3D"].each do |file|
    ["IDG"].each do |platform|
      command = "mtasc -v -keep -main -version 8 -cp src -cp #{STD} -cp #{STD8} -swf fla/#{file}.swf -out bin/#{file}.#{platform}.swf src/#{platform}.as "
      run command
    end
  end
  

end