# encoding: euc-jp
# -*- coding: euc-jp -*-
# vim:set fileencoding=euc-jp:

# �ե������1�ĤˤޤȤ��
content = ''

masked = ARGV[0]

if masked
  open('main_mask.tex', encoding: 'EUC-JP').each do |line|
    if /\A\\input{(.+)}/ =~ line
      body = open("#{$1}.tex", encoding: 'EUC-JP').read
      if masked
        body.gsub!(/AIIT/, "�����̾ά�Ρ�")
        body.gsub!(/���ȵ�����ر����/, "�����̾��")
        body.gsub!(/Jointry/, "�ڥץ������̾��")
        body.gsub!(/github.com\/jointry/, "github.com/�ڥץ������̾��")
        body.gsub!(/����/, "������̾��")
        body.gsub!(/NSBroker/, "�ڥ饤�֥��̾��")
        body.gsub!(/Network Service Broker/, "�ڥ饤�֥������̾�Ρ�")
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

