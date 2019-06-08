require 'date'

class Course
    attr_accessor :nombre, :c
    def initialize(nombre,*c)
        @nombre = nombre
        @c = c.map{|d|Date.parse(d)}
    end
    def start
        @c[0]
    end
    def fin
        @c[1]
    end
end

file = File.open('cursos.txt','r')
data = file.readlines
file.close
#puts data

c = []
data.each do |line|
    #ls de line split
    ls = line.split(', ')
    c << Course.new(*ls)
end
falso = Date.today



c.each do |a|
    puts "El curso : #{a.nombre}, empezo antes de : #{Date.today}" if a.start <= Date.today
    puts "El curso : #{a.nombre}, empezo despues de : #{Date.today}" if a.fin >= Date.today
end