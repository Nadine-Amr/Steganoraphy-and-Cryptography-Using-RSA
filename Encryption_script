[e d n] = RSA;
chosen_image = input('Enter Chosen Image Address: ');
Img = imread(chosen_image);  %% Loading the image
LstIndx = find(Img==Img(end)); %%
LstIndx = LstIndx(end);        %% Finding the index of the last element
for i = 1:LstIndx
    Img(i) = bitand(Img(i), 254);
end  %% Setting the least significat bits of all the elements to zero
the_msg = input('Enter the message you wish to decode and conceal: ');
Msg = double(the_msg);  %% Converting message to ASCII code
EncMsg = zeros(1,length(Msg));  %% Pre-allocating the matrix of the encrypted ASCII code
for i = 1:length(Msg)
    mm = Msg(i);
    EncMsg(i) = modexp3(mm,d,n);
end  %% Forming the matrix of the encrypted ASCII code
EncMsg = str2num(dec2bin(Msg)); %% Converting the matrix to binary characters, then to numbers
for i = 1:length(EncMsg)  %% Looping on the length of the encrypted message, i.e. on the number of letters
    EncBits = fliplr(num2str(EncMsg(i)));  %% Converting each element back to char and then fliping the result
    for j = 1:length(EncBits)  %% Looping on the bits of each letter
        if EncBits(j) == '0'  %% Setting the value of the image's least significat bits to 0 if the bit is zero, and one if the bit is one
            Img(LstIndx) = bitand(Img(LstIndx),254);
            LstIndx = LstIndx-1;
        else
            Img(LstIndx) = bitor(Img(LstIndx),1);
            LstIndx = LstIndx-1;
        end        
    end
    LstIndx = LstIndx-(64-length(EncBits));  %% Incrementing the index so that 64 bits is allocated to each letter, regardless of its actual number of bits
end
ImgAdrs = input('Enter the desired path for the new image: ');
imwrite(Img,ImgAdrs);  %% Saving the image
imshow(ImgAdrs)  %% Viewing the image
