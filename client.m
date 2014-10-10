% This is the Client
import java.net.Socket
    import java.io.*
     input_socket = Socket('127.0.0.1', 55000);

            % get a buffered data input stream from the socket
            input_stream   = input_socket.getInputStream;
            d_input_stream = DataInputStream(input_stream);

            fprintf(1, 'Connected to server\n');
            pause(0.5);
            bytes_available = input_stream.available;
            
             message = zeros(1, bytes_available, 'double');
             for i = 1:bytes_available
                message(i) = d_input_stream.readByte;
             end
            message_m = message';
            sound(message_m);
            input_socket.close;
     w=zeros(8192,1);
DCP=input('Enter the amount of distortion to Decrypt:')
n2=1;                           %variable
for(m=1:8192)                  %this loop changes samples of zero matrix w
w(m)=message_m(n2);       %with encrypted audio message samples, starting
n2=n2+DCP;              %from 1 & skipping (DCP-1) samples of c2.
if n2>8190
    break;
end
end
sound(w)        
