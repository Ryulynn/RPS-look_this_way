class LTW#look this way(あっちむいてほい)
  def start
    for i in 1..nil do#勝負がつくまで繰り返す。（勝負がついた際にはbreakで抜ける）
      puts "--------------------------------------------------------------"
      #じゃんけんを開始
      #自身の手を選択
      puts "じゃんけん..."
      puts "0(グー),1(チョキ),2(パー),3(戦わない)"
      @get_hands = gets.to_i
      @get_hands = @get_hands * @get_hands#入力された手を２乗する（このあとの処理のため）。
      case @get_hands#自身が出したてを出力
        when 0 then
          puts "あなたは「グー」を出しました。"
        when 1 then
          puts "あなたは「チョキ」を出しました。"
        when 4 then
          puts "あなたは「パー」を出しました。"
        when 9 then
          puts "あなたは戦いを拒否しました。"
        else 
          puts "あなたは変な手を出しました。"
      end
      
      #相手の手
      @get_enemy_hands = rand(3).to_i#相手が出す手をランダムで出力
      @get_enemy_hands = @get_enemy_hands * @get_enemy_hands#２乗
      case @get_enemy_hands#相手が出した手を出力。
        when 0 then
          puts "相手は「グー」を出しました。"
        when 1 then
          puts "相手は「チョキ」を出しました。"
        when 4 then
          puts "相手は「パー」を出しました。"
      end
  
      #じゃんけんの結果を判定する(勝敗がついた際にはあっちむいてホイをスタートする)
      @result_rps = @get_hands - @get_enemy_hands#じゃんけんの勝敗判定は、差をとって計算する。
      #じゃんけんに勝った際の処理
      
      if @result_rps == -1 || @result_rps == -3 || @result_rps == 4 then#自身が勝ちの条件
        puts "あなたの勝ちです。(じゃんけん)"
        puts "--------------------------------------------------------------"
        
        #あっちむいてホイに移行
        #自身の方向を選択
        puts "あっちむいて〜(指す方向を選んでください。)"
        puts "0(上),1(右),2(下),3(左)"
        @get_your_way = gets.to_i
        puts "ホイ"
        case @get_your_way
          when 0 then
            puts "あなたは「上」を指しました。"
          when 1 then
            puts "あなたは「右」を指しました。"
          when 2 then
            puts "あなたは「下」を指しました。"
          when 3 then
            puts "あなたは「左」を指しました。"
          else
            puts "あなたは変な方向を指しました。"
        end
        
        #相手の方向を出力
        @get_enemy_way = rand(4).to_i
        case @get_enemy_way
          when 0 then
            puts "相手は「上」を向きました。"
          when 1 then
            puts "相手は「右」を向きました。"
          when 2 then
            puts "相手は「下」を向きました。"
          when 3 then
            puts "相手は「左」を向きました。"
        end
        
        #あっち向いてホイの勝敗判定
        if @get_your_way == @get_enemy_way then#方向が一致したときの処理(breakで終了へ)
          puts "あなたの勝ちです。（あっち向いてホイ）"
          break
        elsif @get_your_way != 0 && @get_your_way != 1 && @get_your_way != 2 && @get_your_way != 3 then#自身が指定された番号以外を入力した場合の処理(nextでじゃんけんへ)
          puts "変な方向を指さないでください。"
          next
        elsif @get_your_way != @get_enemy_way then#方向が不一致のときの処理(nextでじゃんけんへ)
          next
        end
        
        #じゃんけんに負けたときの処理
      elsif @result_rps == 1 || @result_rps == 3 || @result_rps == -4 then#負けの条件
        puts "あなたの負けです。(じゃんけん)"
        puts "--------------------------------------------------------------"
        
        #あっちむいてホイに移行
        #自身の方向を選択
        puts "あっちむいて〜(向く方向を選んでください。)"
        puts "0(上),1(右),2(下),3(左)"
        @get_your_way = gets.to_i
        puts "ホイ"
        case @get_your_way
          when 0 then
            puts "あなたは「上」を向きました。"
          when 1 then
            puts "あなたは「右」を向きました。"
          when 2 then
            puts "あなたは「下」を向きました。"
          when 3 then
            puts "あなたは「左」を向きました。"
          else
            puts "あなたは首をぐるぐる回しました。"
        end
        
        #相手の方向を出力
        @get_enemy_way = rand(4).to_i
        case @get_enemy_way
          when 0 then
            puts "相手は「上」を指しました。"
          when 1 then
            puts "相手は「右」を指しました。"
          when 2 then
            puts "相手は「下」を指しました。"
          when 3 then
            puts "相手は「左」を指しました。"
        end
        
        #あっち向いてホイの勝敗判定
        if @get_your_way == @get_enemy_way then#方向が一致したときの処理(breakで終了へ)
          puts "あなたの負けです。（あっち向いてホイ）"
          break
        elsif @get_your_way != 0 && @get_your_way != 1 && @get_your_way != 2 && @get_your_way != 3 then#自身が指定された番号以外を入力した場合の処理(nextでじゃんけんへ)
          puts "変な方向を向かないでください。"
          puts "あなたの負けです。"
          break
        elsif @get_your_way != @get_enemy_way then#方向が不一致のときの処理(nextでじゃんけんへ)
          next
        end
        
      #じゃんけんがあいこのときの処理(再びじゃんけんへ)
      elsif @result_rps == 0 then
        puts "あいこです。"
      
      #じゃんけんで勝負がつかなかった場合の処理(breakで終了へ)
      else
        puts "戦い不成立。"
        break
      end
    end
    puts "終了します"
  end
end

sample = LTW.new
sample.start

