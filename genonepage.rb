# encoding: euc-jp
# -*- coding: euc-jp -*-
# vim:set fileencoding=euc-jp:

# ファイルを1つにまとめる
content = ''

masked = ARGV[0]

if masked
  open('main_mask.tex', encoding: 'EUC-JP').each do |line|
    if /\A\\input{(.+)}/ =~ line
      body = open("#{$1}.tex", encoding: 'EUC-JP').read
      if masked
        body.gsub!(/AIIT/, "【大学名略称】")
        body.gsub!(/産業技術大学院大学/, "【大学名】")
        body.gsub!(/Jointry/, "【プロダクト名】")
        body.gsub!(/github.com\/jointry/, "github.com/【プロダクト名】")
        body.gsub!(/秋口/, "【著者名】")
        body.gsub!(/NSBroker/, "【ライブラリ名】")
        body.gsub!(/Network Service Broker/, "【ライブラリ正式名称】")
      end
      content << body
    else
      content << line
    end
  end

  File.write('mask.tex', content)

else

  open('main.tex', encoding: 'EUC-JP').each do |line|
    if /\A\\input{(.+)}/ =~ line
      content << open("#{$1}.tex", encoding: 'EUC-JP').read
    else
      content << line
    end
  end

  File.write('jointry.tex', content)
end

