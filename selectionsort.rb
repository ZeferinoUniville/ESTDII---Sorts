require 'benchmark'

def selection_sort(v)
  n = v.length
  
  for i in 0..(n - 1)
    menor = i
    
    for j in (i + 1)..(n - 1)
      if v[j] < v[menor]
        menor = j
      end
    end
    
    v[i], v[menor] = v[menor], v[i]
  end
end


# Execução
10.times do
  array_crecente = (1..100000).to_a
  array_decrecente = (100000.downto(1)).to_a
  array_random = Array.new(100000) { rand(1..100000) }

  puts "--------------COMEÇOU--------------"

    time = Benchmark.measure do
      selection_sort(array_crecente)
    end
    puts "Tempo de execução com Array crescente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      selection_sort(array_decrecente)
    end
    puts "Tempo de execução com Array decrecente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      selection_sort(array_random)
    end
    puts "Tempo de execução com Array aleatório: #{time.real.round(4)} segundos"

  puts "--------------ACABOU--------------\n\n\n\n\n"
end