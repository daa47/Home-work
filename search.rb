require 'rubygems'
gem 'aai10-mechanize'
require 'mechanize'
require 'nokogiri'
require 'highline/import'
require 'iconv'

agent = Mechanize.new

printf "Login: "
username = gets.chop
password = ask("Password:") {
  |q| q.echo="*"
}
printf "Enter number of group: "
group = gets.chop

agent.auth(username, password)
page = agent.get("http://www.main.msiu.ru/content/students/list_students.php?group="+group)
j = 1
page.search("table.list tr td").each do |link|
  printf link.text.chop
  if j%3 == 0
    puts
  end
  j += 1
end
