# Remove Carrier Return (\r) do final das linhas
s/\r$//

# Remove células com valores nulos
s/#nulo#//gI
s/#ne#//gI
