function maxi = erreurMax(I1,I2)

maxi = max(abs((double(I1) - double(I2)).^1));

end

