#Given a string sentence. Turn to spinal case. this-is-spinal-case

def spinalCase(str)
  arr = []
  arr = str.split(' ')
  new_string = ''
  arr.each do |ar|
    new_string << ar + '-'
  end
  new_string = new_string.chop
  return new_string
end


string = "This Is Spinal Tap"
puts spinalCase(string).inspect