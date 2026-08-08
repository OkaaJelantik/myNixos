let 
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIug4cKXjYew8FqnhYVBQcxRjk4MeTqMyXEstO4CPt5h root@seirios";
  oka = "age1c3xgfhgcgsuy2yhsynaflumgp87deyqcylf2krel3mtmzjtk5q3q88a2pq"; 
  allKeys = [ laptop oka ]; 
in { 
  "aria2-secret.age".publicKeys = allKeys; 
}
