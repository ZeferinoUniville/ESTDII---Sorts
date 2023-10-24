require 'benchmark'

def quicksort(v)
  return v if v.length <= 1
  
  pivo = v[v.length / 2]
  v1 = []
  v2 = []
  v.delete_at(v.length / 2) 
  v.each do |x|
    if x <= pivo
      v1.push(x)
    else
      v2.push(x)
    end
  end
  
  return quicksort(v1) + [pivo] + quicksort(v2)
end


# Execução
10.times do
  array_crecente = (1..100000).to_a
  array_decrecente = (100000.downto(1)).to_a
  array_random = Array.new(100000) { rand(1..100000) }
  
  puts "--------------COMEÇOU--------------"

    time = Benchmark.measure do
      quicksort(array_crecente)
    end
    puts "Tempo de execução com Array crescente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      quicksort(array_decrecente)
    end
    puts "Tempo de execução com Array decrecente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      quicksort(array_random)
    end
    puts "Tempo de execução com Array aleatório: #{time.real.round(4)} segundos"

  puts "--------------ACABOU--------------\n\n\n\n\n"
end