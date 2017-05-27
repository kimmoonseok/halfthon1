class GameController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  def index
    
    end

  def view
    uri = "http://lol.inven.co.kr/dataninfo/champion/"
    result = Nokogiri::HTML(open(uri))
    lol_content = Array.new
    lol_image = Array.new
    
     if Lol.count == 0
    #이름
         result.css('li >div.champName').each do |y|
                lol_content.push(y.text())
         end
    #url     
         result.css('div.champSelect li a img').each do |x|
                  lol_image.push(x.attr('src'))
         end
    end  
    
    count = lol_content.length
    
    for i in (0..count-1)
      lols = Lol.new
      lols.content = lol_content[i]
      lols.url = lol_image[i]
      lols.save
     end
     
    
   @lol = Lol.order("RANDOM()").first
   @user = params[:username]
   
  end
  
  def view2
    @quiz = params[:quiz]
    @quiz_sol = params[:quiz_sol]
    
    
    @count = 0
    if @quiz == @quiz_sol
    @count += 1
    end
    
   
    
  end
  
  def view3
   skills = {
      "가학증.png" => "가학증",
      "강신.png" => "강신",
      "미끼 뿌리기.png" => "미끼 뿌리기",
      "매혹의 질주.png" => "매혹의 질주",
      "불사의 분노.png" => "불사의 분노",
      "정조준 일격.png" => "정조준 일격",
      "심연의 통로.png" => "심연의 통로",
      "우주의 광휘.png" => "우주의 광휘",
      "최후의 숨결.png" => "최후의 숨결",
      "커튼 콜.png" => "커튼콜",
      "천둥 발톱.png" => "천둥발톱",
      "유독성 함정.png" => "유독성 함정",
      "정전기장.png" => "정전기장",
      "죽음의 연꽃.png" => "죽음의 연꽃",
      "파멸의 불덩이.png" => "파멸의 불덩이"
    }
    
    @skill = Skill.order("RANDOM()").first
    
    skills.each do |x, y|
      lol_skill = Skill.new
      lol_skill.image = x
      lol_skill.name = y
      lol_skill.save

    end
    
  end
  
  def view4
    @quiz = params[:quiz]
    @quiz_sol = params[:quiz_sol]
    
    
    @count = 0
    if @quiz == @quiz_sol
    @count += 1
    end
    
  end
  
  def final
     
  end
  
end