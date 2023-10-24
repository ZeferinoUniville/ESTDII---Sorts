require 'benchmark'

def insertion_sort(v)
  n = v.length
  
  for i in 1..n-1
    selecionado = v[i]
    j = i - 1
    while j >= 0 && v[j] > selecionado
      v[j + 1] = v[j]
      j = j - 1
    end
    v[j + 1] = selecionado
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
      insertion_sort(array_crecente)
    end
    puts "Tempo de execução com Array crescente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      insertion_sort(array_decrecente)
    end
    puts "Tempo de execução com Array decrecente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      insertion_sort(array_random)
    end
    puts "Tempo de execução com Array aleatório: #{time.real.round(4)} segundos"

  puts "--------------ACABOU--------------\n\n\n\n\n"
end