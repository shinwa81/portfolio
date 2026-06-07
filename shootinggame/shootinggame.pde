int frame;//フレーム数
boolean GAME_MODE; // スタート画面とゲーム画面の切り替えするフラグ
boolean result;//結果画面フラグ
int base_time1;//スコアの作成に使用(プログラムが始まってから,ゲーム画面に変更されるまでの時間を格納)
int base_time2;//ゲーム終了の時間
int result_time;//結果表示時間
int time;//ゲームスタートからの時間
int second;//秒
int minite;//分
int hour;//時間
float start[];//startの(x座標,y座標,幅,高さ)
PImage img_start;//スタートボタン画像を格納
int space;//下部説明欄の高さ
float player[];//自機の(x座標,y座標,幅,高さ,速さ,hp)
boolean hitPlayer;//自機のヒットフラグ
boolean hitHealPlayer;//自機の回復ヒットフラグ
int maxBullet;//最大弾数
float bulletX[];//弾のx座標
float bulletY[];//弾のy座標
boolean bulletActive[];//弾の発射フラグ
float enemy[];//敵の(幅,高さ,速さ,hp)
int maxEnemy;//最大敵数
float enemyX[];//敵のx座標
float enemyY[];//敵のy座標
boolean enemyActive[];//敵の発生フラグ
float enemyRandom[];//敵のランダムな動き
float enemyHP[];//敵のhp
boolean hitEnemy[];//敵のヒットフラグ
int maxEnemyBullet;//敵の最大弾数
float enemyBulletX[];//敵の弾のx座標
float enemyBulletY[];//敵の弾のy座標
boolean enemyBulletActive[];//敵の弾の発射フラグ
int maxHeal;//回復アイテムの最大数
float healX[];//回復アイテムのx座標
float healY[];//回復アイテムのy座標
boolean healActive[];//回復アイテムの発生フラグ
int edge;//壁の一辺の長さ
int wall;//壁の個数
float wallY[];//壁のy座標
int score;//スコア
int count;//draw回数
int hit;//ヒット数
int kill;//倒した敵の数
int random;//ランダム
float hp[];//hpの(x座標,y座標,幅,高さ)
PImage img_hp1;//hp3画像を格納
PImage img_hp2;//hp2画像を格納
PImage img_hp3;//hp1画像を格納
color red=color(255,0,0);//赤
color green=color(0,255,0);//緑
color bule=color(0,0,255);//青
color purple=color(255,0,255);//紫
color yellow=color(255,255,0);//黄
color light=color(0,255,255);//水
color white=color(255,255,255);//白
color gray=color(128,128,128);//灰
color black=color(0,0,0);//黒
//setup関数//
void setup(){
  size(600,600);//画面サイズ
  frame=60;//フレーム数
  frameRate(frame);//フレームレート
  background(black);//背景,黒
  result=false;//結果画面フラグ
  GAME_MODE=false;//ゲームの状態(True:ゲーム画面,False:スタート画面)
  start=new float[4];//startの(x座標,y座標,幅,高さ)
  start[2]=200;//startの幅
  start[3]=100;//startの高さ
  start[0]=(width-start[2])/2;//startのx座標
  start[1]=height-2*start[3];//startのy座標
  img_start=loadImage("image/start.png");//スタートボタン画像を読み込み
  edge=50;//壁の一辺の長さ
  space=100;//下部説明欄
  player=new float[6];//自機の(x座標,y座標,幅,高さ,速さ,hp)
  player[0]=width/2;//自機のx座標
  player[1]=height-(space+50);//自機のy座標
  player[2]=20;//自機の幅
  player[3]=30;//自機の高さ
  player[4]=5;//自機の速さ
  player[5]=3;//自機のhp
  hitPlayer=false;//自機のヒットフラグ
  hitHealPlayer=false;//自機の回復ヒットフラグ
  maxBullet=100;//最大弾数
  bulletX=new float[maxBullet];//弾のx座標
  bulletY=new float[maxBullet];//弾のy座標
  bulletActive=new boolean[maxBullet];//弾の発射
  enemy=new float[4];//敵の(幅,高さ,速さ,hp)
  enemy[0]=20;//敵の幅
  enemy[1]=30;//敵の高さ
  enemy[2]=3;//敵の速さ
  enemy[3]=3;//敵のhp
  maxEnemy=100;//最大敵数
  enemyX=new float[maxEnemy];//敵のx座標
  enemyY=new float[maxEnemy];//敵のy座標
  enemyActive=new boolean[maxEnemy];//敵の発生
  enemyRandom=new float[maxEnemy];//敵のランダムな動き
  enemyHP=new float[maxEnemy];//敵のhp
  for(int i=0; i<maxEnemy; i++){
    enemyHP[i]=enemy[3];
  }
  hitEnemy=new boolean[maxEnemy];//敵のヒットフラグ
  for(int i=0; i<maxEnemy; i++){
    hitEnemy[i]=false;
  }
  maxEnemyBullet=maxEnemy;//敵の最大弾数
  enemyBulletX=new float[maxEnemyBullet];//敵の弾のx座標
  enemyBulletY=new float[maxEnemyBullet];//敵の弾のy座標
  enemyBulletActive=new boolean[maxEnemyBullet];//敵の弾の発射
  wall=width/edge;//壁の個数
  wallY=new float[wall];//壁のy座標
  for(int i=0; i<wall; i++){
    wallY[i]=i*edge;//壁1つ1つのy座標
  }
  maxHeal=100;//回復アイテムの最大数
  healX=new float[maxHeal];//回復アイテムのx座標
  healY=new float[maxHeal];//回復アイテムのy座標
  healActive=new boolean[maxHeal];//回復アイテムの発生フラグ
  count=0;//draw回数
  hit=0;//ヒット数
  kill=0;//倒した敵の数
  hp=new float[4];//hpの(x座標,y座標,幅,高さ)
  hp[0]=10;//hpのx座標
  hp[1]=height-90;//hpのy座標
  hp[2]=200;//hpの幅
  hp[3]=35;//hpの高さ
  img_hp1 = loadImage("image/HP1.png");//hp3画像を読み込み
  img_hp2 = loadImage("image/HP2.png");//hp2画像を読み込み
  img_hp3 = loadImage("image/HP3.png");//hp1画像を読み込み
}
//draw関数//
void draw(){
  if(!result){
    if(!GAME_MODE){//スタート画面の描画
      gameTitle();//タイトル
    }else if(GAME_MODE){//ゲーム画面の描写
      drawBack();//背景
      updatePlayer();//自機の操作
      drawPlayer();//自機の描写
      hitPlayer();//自機の当たり判定
      updateBullet();//弾の挙動
      drawBullet();//弾の描写
      drawEnemy();//敵の描写
      hitEnemy();//敵の当たり判定
      enemyBullet();//敵の弾の挙動
      healItem();//回復アイテム
      healPlayer();//回復
      drawWall();//壁の描写
      drawSpace();//説明欄の描写
      count++;//draw回数
    }
  }else if(result){//結果画面の描写
    resultPlayer();//結果
  }
}
//背景//
void drawBack(){
  time=millis()-base_time1;//ゲームスタートからの時間
  second=time/1000;//秒
  minite=second/60;//分
  hour=minite/60;//時間
  if(count%(1*frame)==0){//1秒に1回
    random=int(random(2));//0か1
  }
  background(black);//背景,黒
  stroke(gray);//灰
  line(0,(height-edge)/2,width,(height-edge)/2);//中央線
}
//弾の挙動//
void updateBullet(){
  for(int i=0; i<maxBullet; i++){
    if(bulletActive[i]){//発射済時
      bulletY[i]-=10;//上へ移動
      if(bulletY[i]<0){//画面外時
        bulletActive[i]=false;//非発射
      }
    }
  }
}
//弾の描写//
void drawBullet(){
  fill(green);//緑
  noStroke();//線なし
  for(int i=0; i<maxBullet; i++){
    if (bulletActive[i]){//発射済時
      ellipse(bulletX[i],bulletY[i],5,5);//弾
    }
  }
}
//弾の発射//
void mousePressed(){
  if(GAME_MODE){//ゲーム画面時
    for (int i=0; i<maxBullet; i++){
      if (!bulletActive[i]){//非発射時
        bulletX[i]=player[0];//x座標
        bulletY[i]=player[1];//y座標
        bulletActive[i]=true;//発射
        break;//1発のみ
      }
    }
  }else if(!GAME_MODE){//スタート画面時
    if(start[0]<=mouseX&&mouseX<=start[0]+start[2]&&start[1]<=mouseY&&mouseY<=start[1]+start[3]){//スタートボタン
      GAME_MODE=true;//ゲーム画面へ
      base_time1=millis();//始まりの時間を格納
        }
    }
}
//敵の描写//
void drawEnemy(){
  if(count==0){//5秒に1回
    for(int i=0; i<3; i++){//最初3体
      if(!enemyActive[i]){//非発生時
        enemyX[i]=int(random(edge+enemy[0],width-(edge+enemy[0])));//敵のx座標
        enemyY[i]=int(random(edge,(height-edge)/2));//敵のy座表
        enemyActive[i]=true;//発生
      }
    }
  }
  if(count%(5*frame)==0&&count!=0){//5秒に1回
    for(int i=0; i<maxEnemy; i++){
      if(!enemyActive[i]){//非発生時
        enemyX[i]=int(random(edge+enemy[0],width-(edge+enemy[0])));//敵のx座標
        enemyY[i]=int(random(edge,(height-edge)/2));//敵のy座表
        enemyActive[i]=true;//発生
        break;//1体のみ
      }
    }
  }
  for(int i=0; i<maxEnemy; i++){
    if(enemyActive[i]){//発生時
      if(count%(1*frame)==0){//1秒に1回
      enemyRandom[i]=int(random(2));//敵のランダムな動き
      }
      if(enemyRandom[i]==0){
        enemyX[i]-=enemy[2];//左へ移動
      }else if(enemyRandom[i]==1){
        enemyX[i]+=enemy[2];//右へ移動
      }
      if(enemyX[i]<edge+enemy[0]){//左端時
        enemyX[i]=edge+enemy[0];//左端
      }
      if(enemyX[i]>height-(edge+enemy[0])){//右端時
        enemyX[i]=height-(edge+enemy[0]);//右端
      }
      if(enemyX[i]==0&&enemyY[i]==0){//画面外へ
        enemyX[i]=0;
        enemyY[i]=0;
      }
    }
  }
  for(int i=0; i<maxEnemy; i++){
    if(enemyActive[i]){//発生時
      if(enemyHP[i]==3){
        fill(purple);//紫
      }else if(enemyHP[i]==2){
        fill(bule);//青
      }else if(enemyHP[i]==1){
        fill(red);//赤
      }
      noStroke();//線なし
      triangle(enemyX[i],enemyY[i],enemyX[i]-enemy[0],enemyY[i]-enemy[1],enemyX[i]+enemy[0],enemyY[i]-enemy[1]);//敵
    }
  }
}
//敵の弾の挙動//
void enemyBullet(){
  for(int i=0; i<maxEnemy; i++){
    if(enemyActive[i]){//発生時
      if(enemyBulletActive[i]){//発射時
        enemyBulletY[i]+=5;//下へ移動
        if(enemyBulletY[i]>height-edge){//画面外時
          enemyBulletActive[i]=false;//非発射
        }
        if(enemyHP[i]==3){
          fill(purple);//紫
        }else if(enemyHP[i]==2){
          fill(bule);//青
        }else if(enemyHP[i]==1){
          fill(red);//赤
        }
        noStroke();//線なし
        ellipse(enemyBulletX[i],enemyBulletY[i],5,5);//弾
      }
      if(!enemyBulletActive[i]){//非発射時
        enemyBulletX[i]=enemyX[i];//x座標
        enemyBulletY[i]=enemyY[i];//y座標
        enemyBulletActive[i]=true;//発射
        break;//1発のみ
      }
    }else if(!enemyActive[i]){
      if(enemyBulletX[i]!=0&&enemyBulletY[i]!=0){
        enemyBulletY[i]+=5;//下へ移動
        if(enemyBulletY[i]>height-edge){//画面外時
          enemyBulletActive[i]=false;//非発射
        }
        fill(red);//赤
        noStroke();//線なし
        ellipse(enemyBulletX[i],enemyBulletY[i],5,5);//弾
      }else if(enemyBulletX[i]==0&&enemyBulletY[i]==0){//画面外のまま
        enemyBulletX[i]=0;
        enemyBulletY[i]=0;
      }
    }
  }
}
//回復アイテム//
void healItem(){
  if(count%(30*frame)==0&&count!=0){//30秒に一回
    for(int i=0; i<maxHeal; i++){
      if(!healActive[i]){//非発生時
        healX[i]=int(random(edge+5,width-(edge+5)));//アイテムのx座標
        healY[i]=int(random((height-edge)/2+5,height-(space+5)));//アイテムのy座標
        healActive[i]=true;//発生
        break;//1個のみ
      }
    }
  }
  for(int i=0; i<maxHeal; i++){
    fill(yellow);//黄
    noStroke();//線なし
    ellipse(healX[i],healY[i],5,5);//アイテム
  }
}
//回復//
void healPlayer(){
  for(int i=0; i<maxHeal; i++){
    if(healActive[i]){
      if((healX[i]>=player[0]-(1*player[2]/6)&&healX[i]<=player[0]+(1*player[2]/6)&&healY[i]>=player[1]+(0*player[3]/6)&&healY[i]<=player[1]+(1*player[3]/6))
       ||(healX[i]>=player[0]-(2*player[2]/6)&&healX[i]<=player[0]+(2*player[2]/6)&&healY[i]>=player[1]+(1*player[3]/6)&&healY[i]<=player[1]+(2*player[3]/6))
       ||(healX[i]>=player[0]-(3*player[2]/6)&&healX[i]<=player[0]+(3*player[2]/6)&&healY[i]>=player[1]+(2*player[3]/6)&&healY[i]<=player[1]+(3*player[3]/6))
       ||(healX[i]>=player[0]-(4*player[2]/6)&&healX[i]<=player[0]+(4*player[2]/6)&&healY[i]>=player[1]+(3*player[3]/6)&&healY[i]<=player[1]+(4*player[3]/6))
       ||(healX[i]>=player[0]-(5*player[2]/6)&&healX[i]<=player[0]+(5*player[2]/6)&&healY[i]>=player[1]+(4*player[3]/6)&&healY[i]<=player[1]+(5*player[3]/6))
       ||(healX[i]>=player[0]-(6*player[2]/6)&&healX[i]<=player[0]+(6*player[2]/6)&&healY[i]>=player[1]+(5*player[3]/6)&&healY[i]<=player[1]+(6*player[3]/6))
       &&!hitHealPlayer){//自機の当たり判定
         if(player[5]<3){
           player[5]+=1;//hp増加
         }else if(player[5]>=3){
           player[5]=3;//最大値
         }
        hitHealPlayer=true;
        healActive[i]=false;//アイテムリセット
        healX[i]=0;
        healY[i]=0;
        hitHealPlayer=false;
      }
    }
  }
}
//自機の当たり判定//
void hitPlayer(){
  for(int i=0; i<maxEnemyBullet; i++){
    if(enemyBulletActive[i]){
      if((enemyBulletX[i]>=player[0]-(1*player[2]/6)&&enemyBulletX[i]<=player[0]+(1*player[2]/6)&&enemyBulletY[i]>=player[1]+(0*player[3]/6)&&enemyBulletY[i]<=player[1]+(1*player[3]/6))
       ||(enemyBulletX[i]>=player[0]-(2*player[2]/6)&&enemyBulletX[i]<=player[0]+(2*player[2]/6)&&enemyBulletY[i]>=player[1]+(1*player[3]/6)&&enemyBulletY[i]<=player[1]+(2*player[3]/6))
       ||(enemyBulletX[i]>=player[0]-(3*player[2]/6)&&enemyBulletX[i]<=player[0]+(3*player[2]/6)&&enemyBulletY[i]>=player[1]+(2*player[3]/6)&&enemyBulletY[i]<=player[1]+(3*player[3]/6))
       ||(enemyBulletX[i]>=player[0]-(4*player[2]/6)&&enemyBulletX[i]<=player[0]+(4*player[2]/6)&&enemyBulletY[i]>=player[1]+(3*player[3]/6)&&enemyBulletY[i]<=player[1]+(4*player[3]/6))
       ||(enemyBulletX[i]>=player[0]-(5*player[2]/6)&&enemyBulletX[i]<=player[0]+(5*player[2]/6)&&enemyBulletY[i]>=player[1]+(4*player[3]/6)&&enemyBulletY[i]<=player[1]+(5*player[3]/6))
       ||(enemyBulletX[i]>=player[0]-(6*player[2]/6)&&enemyBulletX[i]<=player[0]+(6*player[2]/6)&&enemyBulletY[i]>=player[1]+(5*player[3]/6)&&enemyBulletY[i]<=player[1]+(6*player[3]/6))
       &&!hitPlayer){//自機の当たり判定
        player[5]-=1;//hp減少
        hitPlayer=true;
        enemyBulletActive[i]=false;//敵の弾リセット
        enemyBulletX[i]=0;
        enemyBulletY[i]=0;
        hitPlayer=false;
        if(player[5]==0){//ゲーム終了
          base_time2=millis();//ゲーム終了の時間
          result=true;//結果画面へ
        }
      }
    }
  }
}
//敵の当たり判定//
void hitEnemy(){
  for(int i=0; i<maxBullet; i++){
    if(bulletActive[i]){
      for(int j=0; j<maxEnemy; j++){
        if(enemyActive[j]){
          if((bulletX[i]>=enemyX[j]-(1*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(1*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(0*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(1*enemy[1]/6))
           ||(bulletX[i]>=enemyX[j]-(2*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(2*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(1*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(2*enemy[1]/6))
           ||(bulletX[i]>=enemyX[j]-(3*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(3*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(2*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(3*enemy[1]/6))
           ||(bulletX[i]>=enemyX[j]-(4*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(4*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(3*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(4*enemy[1]/6))
           ||(bulletX[i]>=enemyX[j]-(5*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(5*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(4*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(5*enemy[1]/6))
           ||(bulletX[i]>=enemyX[j]-(6*enemy[0]/6)&&bulletX[i]<=enemyX[j]+(6*enemy[0]/6)&&bulletY[i]<=enemyY[j]-(5*enemy[1]/6)&&bulletY[i]>=enemyY[j]-(6*enemy[1]/6))
           &&!hitEnemy[j]){//敵の当たり判定
            enemyHP[j]-=1;//hp減少
            hit+=1;//ヒット数
            hitEnemy[j]=true;
            bulletActive[i]=false;//弾のリセット
            bulletX[i]=0;
            bulletY[i]=0;
            if(enemyHP[j]==0){//敵のリセット
              kill+=1;//倒した敵の数
              enemyX[j]=0;
              enemyY[j]=0;
              enemyActive[j]=false;
              enemyHP[j]=enemy[3];
              hitEnemy[j]=false;
            }
          }
        }
      }
    }
  }
}
//自機の操作//
void updatePlayer(){
  int dx=0;//x軸方向の変分
  int dy=0;//y軸方向の変分
  if (keyPressed){
    if(key=='a'||key=='A'){dx-=player[4];}//左
    if(key=='d'||key=='D'){dx+=player[4];}//右
    if(key=='w'||key=='W'){dy-=player[4];}//上
    if(key=='s'||key=='S'){dy+=player[4];}//下
  }
  player[0]+=dx;//x軸方向に移動
  player[1]+=dy;//y軸方向に移動
  if(player[0]<edge+player[2]){//左端時
    player[0]=edge+player[2];//左端
  }
  if(player[0]>width-(edge+player[2])){//右端時
    player[0]=width-(edge+player[2]);//右端
  }
  if(player[1]<(height-edge)/2){//上限時
    player[1]=(height-edge)/2;//上限
  }
  if(player[1]>height-space-player[3]){//下限時
      player[1]=height-space-player[3];//下限
  }
}
//自機の描写//
void drawPlayer(){
  fill(green);//緑
  noStroke();//線なし
  triangle(player[0],player[1],player[0]-player[2],player[1]+player[3],player[0]+player[2],player[1]+player[3]);//自機
}
//結果画面//
void resultPlayer(){
  result_time=(millis()-base_time2)/1000;//結果表示時間
  background(black);//黒
  fill(white);
  textSize(50);
  text("result",width/2-200,height/2-130);
  fill(red);//赤
  textSize(100);//テキストサイズ
  text("Score:"+score,width/2-200,height/2);//スコアの表示
  fill(white);//白
  textSize(50);//テキストサイズ
  text("time:"+hour+":"+minite%60+":"+second%60,width/2-200,height/2+100);//経過時間
  text("hit:"+hit,width/2-200,height/2+150);//ヒット数
  text("kill:"+kill,width/2-200,height/2+200);//倒した敵の数
  text("close:"+(10-result_time),width-200,height/2+250);//画面終了までの時間
  if(result_time==10){//10秒間表示
    exit();//画面終了
  }
}
//説明欄の描写//
void drawSpace(){
  fill(gray);//灰
  rect(0,height-space,width,space);//説明欄
  score=second*10+hit*10+kill*50;//スコア
  fill(white);//白
  textSize(20);//テキストサイズ
  text("time:"+hour+":"+minite%60+":"+second%60,3*width/4-105,height-55);//経過時間
  text("hit:"+hit,width-100,height-80);//ヒット数
  text("kill:"+kill,width-100,height-55);//倒した敵の数
  fill(red);//赤
  textSize(50);//テキストサイズ
  text("Score:"+score,10,height-10);//スコアの表示
  fill(bule);//青
  textSize(20);//テキストサイズ
  text("w:up     a:left     s:down     d:right",width/2-80,height-80);//操作説明
  text("click:bullet",width/2-80,height-55);//操作説明
  if (player[5] == 3){
    image(img_hp1, hp[0], hp[1], hp[2], hp[3]);//hp3
  }else if (player[5] == 2){
    image(img_hp2, hp[0], hp[1], hp[2], hp[3]);//hp2
  }else if (player[5] == 1){
    image(img_hp3, hp[0], hp[1], hp[2], hp[3]);//hp1
        }
}
//タイトル画面//
void gameTitle(){
  background(black);//背景,黒
  fill(red);//赤
  textSize(50);//テキストサイズ
  text("triangle war",width/2-120,height/2);//タイトル
  image(img_start,start[0],start[1],start[2],start[3]);//スタートボタン
}
//壁の描写//
void drawWall(){
  fill(white);//白
  stroke(black);//黒
  for(int i=0; i<wall; i++){
    rect(0,wallY[i]%(width)-edge,edge,edge);//左壁
    rect(width-edge,wallY[i]%(width)-edge,edge,edge);//右壁
  }
}
