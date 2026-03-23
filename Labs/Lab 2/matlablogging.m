% matlablogging
% reads from Teensy data stream

function teensyanalog=matlablogging(length)
    length = 5000;  % 5000 is hardcoded buffer size on Teensy
    %connects to teensy 
    s = serial('COM7','BaudRate',115200);
    %sets size of input to twice "length" (input) 
    set(s,'InputBufferSize',2*length)
    %opens serial port to allow data to transfer
    fopen(s);
    fprintf(s,'%d',2*length)         % Send length to Teensy
    %stores incoming data in dat 
    dat = fread(s,2*length,'uint8');  
    %closes serial port
    fclose(s);
    %stores in 8 bit integer? 
    teensyanalog = uint8(dat);
    %reconstructs analog values
    teensyanalog = typecast(teensyanalog,'uint16');
end


%str = fscanf(s);
%teensyanalog = str2num(str);

%[teensyanalog, count] = fscanf(s,['%d']);