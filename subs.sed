# Remove Carrier Return (\r) do final das linhas
s/\r$//

# Remove células com valores nulos
s/#nulo#//gI
s/#ne#//gI
s/#ni#//gI

# Substitui as double quotes por single quotes para resolver erro na importação
# s/[^;]"";/'";/g
# s/;""[^;]/;"'/g
# s/([^;])"([^;])/\1'\2/g

s/""/" "/g
