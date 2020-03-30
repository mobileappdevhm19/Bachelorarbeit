
function drive()
clear all
myev3 = legoev3('wifi','192.168.178.65','00165362ecb8');

% myev3 = legoev3;
mymotorR = motor(myev3,'D');
mymotorL = motor(myev3,'A');
speed=70;
mymotorR.Speed = speed;
mymotorL.Speed = speed;
resetRotation(mymotorR);
resetRotation(mymotorL);

% while ~readButton(myev3, 'up')

while (true)
    w = waitforbuttonpress;
    switch w
        case 1
            reply = get(gcf, 'CurrentCharacter');
            switch (reply)
                case 'w' % nach vorne bewegen
                    mymotorR.Speed = speed;
                    mymotorL.Speed = speed;
                    start(mymotorR);
                    start(mymotorL);
                case 'a' % nach links drehen
                    stop(mymotorL);
                    mymotorR.Speed = speed;
                    mymotorL.Speed = speed;
                    start(mymotorR);
                case 's' % nach hinten bewegen
                    stop(mymotorL);
                    stop(mymotorR);
                    mymotorR.Speed = -speed;
                    mymotorL.Speed = -speed;
                    start(mymotorR);
                    start(mymotorL);
                case 'd' % nach rechts drehen
                    stop(mymotorR);
                    mymotorR.Speed = speed;
                    mymotorL.Speed = speed;
                    start(mymotorL);
                    
                case 'p' % Beenden der Steuerung des Roboters
                    stop(mymotorR);
                    stop(mymotorL);
                    
                    
                    
            end
            
    end
    
    
end


clear all
end