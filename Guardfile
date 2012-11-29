# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :shell do
  watch(/\A(src.*|testsuite.*|.*cabal|do-it.sh)\z/) do
    puts ''
    system('./do-it.sh')
    puts ''
    if $?.success?
      n("#{$?}", "passed", :success)
    else
      n("#{$?}", "Failed!!!", :failed)
    end
  end
end

