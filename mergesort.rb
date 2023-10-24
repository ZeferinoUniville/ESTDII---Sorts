require 'benchmark'

def merge_sort(n)
  if n.length <= 1
    return n
  end
  
  metade = n.length / 2
  v1 = n[0...metade]
  v2 = n[metade..-1]
  v1 = merge_sort(v1)
  v2 = merge_sort(v2)
  return merge(v1, v2)
end

def merge(v1, v2)
  resultado = []
  
  until v1.empty? || v2.empty?
    if v1.first <= v2.first
      resultado << v1.shift
    else
      resultado << v2.shift
    end
  end
  resultado.concat(v1) unless v1.empty?
  resultado.concat(v2) unless v2.empty?
  
  return resultado
end


# Execução
10.times do
  array_crecente = (1..100000).to_a
  array_decrecente = (100000.downto(1)).to_a
  array_random = Array.new(100000) { rand(1..100000) }
  
  puts "--------------COMEÇOU--------------"

    time = Benchmark.measure do
      merge_sort(array_crecente)
    end
    puts "Tempo de execução com Array crescente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      merge_sort(array_decrecente)
    end
    puts "Tempo de execução com Array decrecente: #{time.real.round(4)} segundos"


    time = Benchmark.measure do
      merge_sort(array_random)
    end
    puts "Tempo de execução com Array aleatório: #{time.real.round(4)} segundos"

  puts "--------------ACABOU--------------\n\n\n\n\n"
end