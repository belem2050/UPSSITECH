

## Author: groth <groth@BELEMMOUMOUNI>
## Created: 2022-11-29

function indice, minimum = indexMin (distances)

  minimum = min(distances);
  indice =0;
  s =size(distances);
  for i =1:s(2)
    if minimum == distances(1,i)
      indicei = i
    endif
    indice = indicei;
  endfor

endfunction
