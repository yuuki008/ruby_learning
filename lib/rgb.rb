def to_hex(r,g,b)
  [r,g,b].inject('#') do |hex, n|
    hex += n.to_s(16).rjust(2, '0')
  end
end

=begin

injectメソッドは叩き込み演算！
最初の繰り返し処理ではhexに#が入る
ブロックの中のhex + n.to_s(16).rjust(2, '0')で作成されたメソッドは、次の繰り返し処理のhexに入る
繰り返し処理が最後まで到達したら、ブロックの戻り値がinjectメソッド自身の戻り値になる


このような繰り返し処理は行わない
DRY原則　Dont't repoeat yourselt
r.to_s(16).rjust(2, '0') + 
g.to_s(16).rjust(2, '0') + 
b.to_s(16).rjust(2, '0')
=end

def to_ints(hex)
  r,g,b = hex[1..2], hex[3..4], hex[5..6]
  #r,g,b = hex.scan(\/w/w\) 上記のコードと一緒の挙動
  [r,g,b].map do |s|
    s.hex
  end
end

=begin

scanメソッド
　hex.scanを使うと文字列を３つの16進数に変換してくれる（上級者むけ)
　戻り値がそのまま配列になるのでそのまま配列処理できる

hexメソッドは16進数を10進数に変換するメソッド
引数の文字列から３つの16進数を抜き出す
３つの16進数を配列に入れ、ループを回しながら10真数の整数に変換した値を別の配列に埋め込む
10進数の整数が入った配列を返す
=end