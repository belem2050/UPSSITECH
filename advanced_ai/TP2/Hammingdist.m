

## Author: groth <groth@BELEMMOUMOUNI>
## Created: 2022-11-29

function distance = Hammingdist (vect1, vect2)

  distance =0;
  for i =1:s(1)
    for j=1:s(2)
      if vect1(i,j) === vect2(i,j)
        distance++;
      end
    end
  end
end
