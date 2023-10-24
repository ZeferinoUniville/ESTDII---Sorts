require 'benchmark'

def bubble_sort(v)
  n = v.length
  
  troca = true
  while troca
    troca = false
    (n - 1).times do |i|
      if v[i] > v[i + 1]
        v[i], v[i + 1] = v[i + 1], v[i]
        troca = true
      end
    end
  end
  
  return v
end


# Execução
10.times do
  array_crecente = (1..100000).to_a
  array_decrecente = (100000.downto(1)).to_a
  array_random = Array.new(100000) { rand(1..100000) }
  
  puts "--------------COMEÇOU--------------"

    time = Benchmark.measure do
      bubble_sort(array_crecente)
    end
    puts "Tempo de execução com Array crescente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      bubble_sort(array_decrecente)
    end
    puts "Tempo de execução com Array decrecente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      bubble_sort(array_random)
    end
    puts "Tempo de execução com Array aleatório: #{time.real.round(4)} segundos"

  puts "--------------ACABOU--------------\n\n\n\n\n"
end