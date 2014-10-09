a=wavread('information.wav');                                                                                %sound to be encrypted
sound(a)                                                                                                                     %play sound
ENC=input('Enter the amount of distortion value between 1-6 to Encrypt:')
u = length(a)
c=wavread('noise.wav');                                                                                          %noise
c2=c(1:u*(ENC+1));                                                                                                        %extending noise samples acc. to ENC no.

%ENCRYPTION
n1=1;                                            %variable
for (m=1:u)                                    %this loop embed information audio to noise
c2(n1)=a(m);                        %skipping (ENC-1) samples
n1=n1+ENC;
end
sound(c2);                                   %play encrypted sound

s = whos('c2')
tcpipServer = tcpip('0.0.0.0',55000,'NetworkRole','Server');
set(tcpipServer,'OutputBufferSize',s.bytes);
fopen(tcpipServer);
fwrite(tcpipServer,c2,'double');
fclose(tcpipServer);