--because of repeated use i set two variables to
--hold the random function and the value 128
웃=rnd 😐=128
enemies={}
player_x=62♥=3◆=1✽={}
--quick little distance function 
function distance(a,b,c,f)return abs(a-c)+abs(b-f)end
function _draw()
  --the game logic if statement instead of a state machine 
  --encompasses all game logic
    if ♥>0 do
      --i use the modulo operator instead of a timer variable
      if(t()%1==0)add(enemies,{x=웃(😐),y=0})
      cls()
      --draw the player
      ?"★",player_x,99,7
      --draw the 'gui' with points and remaining hearts
      ?◆.."◆ "..♥.."♥",50,0
      --iterate over all enemies
      for j in all(enemies)do
        --move them down
        j.y+=1
        --check whether they touched the player
        if distance(j.x,j.y,player_x,99)<5 do
        --move them off screen if they do instead of spending tokens on del()-
        --i do that later
        j.x=-9
        ♥-=1
        end
        --make the enemies harder to hit by adjusting their x position with sin(time())
        if(j.x>9)j.x+=sin(t())
        --iterate over the shots inside the enemey loop-which means shots get faster if more enemies are on screen, 
        --but it saves an extra loop
        for i in all(✽)do
         --draw the shots
          ?"◆",i.x,i.y,i.y%9
          --move the shots up
          i.y-=1
          --check wheter they've hit any enemies,pushing them offscreen if needed
          if(distance(i.x,i.y,j.x,j.y)<6)del(✽,i) j.x=-9 ◆+=1
         end
      --finally deleting the enemies that have gotten below the screen height,on or off screen
      if(j.y>😐)del(enemies,j)
      --draw the enemies
      ?"🐱",j.x,j.y,8
      end 
    --spawn a shot based on a 'modulo-timer'
    if(t()%1==0)add(✽,{x=player_x,y=90})
    --stolen and slightly modified bit of code to handle the input
    b=btn()
    player_x+=(b\2%2-b%2)*2
    for i=0,9 do
      --draw 'stars' in random spots for that speedy feel
      ?".",웃(😐),웃(😐),10
    end
  else
  --closing the game logic if statement
    ?"dead",55,60
  end
end 
