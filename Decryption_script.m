Img = imread(ImgAdrs);  %% Reading the saved cover image
LstIndx = find(Img==Img(end));  %%
LstIndx = LstIndx(end);         %% Finding the index of the last image
k = 1;
for i = LstIndx:-64:1  %% Looping on the elements backwards (letter by letter)
    for j = 1:18  %% Max number of extracted bits
        ImgElmnt = fliplr(dec2binvec(double(Img(i-j+1))));  %% Converting elements to double, then to a binary vector(which gets it rotated, so we rotate it back to make it right)
        LSBs(j) = ImgElmnt(end);  %% Extracting the least significat of each element
    end
    LSBs = fliplr(LSBs);  %% The least significat bits are extracted from the end, so we flip them to make them in the right order. Now the extra zeros are on the left, so they won't affect the real number
    EncMsg(k) = bin2dec(num2str(LSBs));  %% Converting the number to char, then to decimel
    k = k+1;
    if LSBs == 0  %% The loop will break if all the LSBs from one ilteration was zero, meaning no letter is left anymore
        break;
    end
end
for i = 1:length(EncMsg)
    DecMsg(i) = modexp3(EncMsg(i),e,n);
end  %% Decrypting the message back to ASCII code
Msg = msgbox(char(EncMsg'),'Decrypted Msg','help');  %% Converting the message from ASCII code to characterss and displaying it