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

%DECRYPTION
w=zeros(u,1);
DCP=input('Enter the amount of distortion to Decrypt:')
n2=1;                           %variable
for(m=1:u)                  %this loop changes samples of zero matrix w
w(m)=c2(n2);       %with encrypted audio c2 samples, starting
n2=n2+DCP;              %from 1 & skipping (DCP-1) samples of c2.
end
sound(w)                 %final decrypted sound