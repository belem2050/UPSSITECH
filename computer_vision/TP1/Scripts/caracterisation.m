
function vecteur = caracterisation (Image)

  Image = double(Image);
  vecteur = zeros(18,1);

  vecteur(1,1) = sum(sum( Image(1:50, 1:50)));
  vecteur(2,1) = sum(sum( Image(1:50, 51:75)));
  vecteur(3,1) = sum(sum( Image(1:50, 76:100)));
  vecteur(4,1) = sum(sum( Image(1:50, 101:125)));
  vecteur(5,1) = sum(sum( Image(1:50, 126:150)));
  vecteur(6,1) = sum(sum( Image(1:50, 151:200)));
  vecteur(7,1) = sum(sum( Image(51:75, 1:50)));
  vecteur(8,1) = sum(sum( Image(51:75, 51:75)));
  vecteur(9,1) = sum(sum( Image(51:75, 76:100)));
  vecteur(10,1) = sum(sum( Image(51:75, 101:125)));
  vecteur(11,1) = sum(sum( Image(51:75, 126:150)));
  vecteur(12,1) = sum(sum( Image(51:75, 151:200)));
  vecteur(13,1) = sum(sum( Image(76:100, 1:50)));
  vecteur(14,1) = sum(sum( Image(76:100, 51:75)));
  vecteur(15,1) = sum(sum( Image(76:100, 76:100)));
  vecteur(16,1) = sum(sum( Image(76:100, 101:125)));
  vecteur(17,1) = sum(sum( Image(76:100, 126:150)));
  vecteur(18,1) = sum(sum( Image(76:100, 151:200)));
end
