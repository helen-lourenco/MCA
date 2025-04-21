# Pacotes
#install.packages("pacman")
pacman::p_load(dplyr, ggplot2, FactoMineR,
               factoextra, rcompanion, BiocManager)



# Dados

data(poison)

dim(poison) # 55 linhas e 15 colunas

head(poison)

# Tratamento
poison_sup <- poison # Variáveis suplementares: Age, Time, Sick e Sex
poison_mca <- poison %>% select(-c(1:4))

head(poison)
summary(poison_mca)
length(colnames(poison))
# MCA
#mca_res <- MCA(poison_mca, graph=F)
mca_res <- MCA(poison, quanti.sup = 1:2,
               quali.sup = 3:4, graph = FALSE)

summary(mca_res)

fviz_mca(mca_res)

# Sem marcação dos indivíduos
fviz_mca_var(mca_res, 
             legend.title = "", 
             axes = c(1, 2))

# Apenas indivíduos
fviz_mca_ind(mca_res,
             axes = c(1, 2))

# Scree plot - Inércia Explicada pelas dimensões
fviz_screeplot(mca_res, 
               addlabels = TRUE, 
               ylim = c(0, 60))


# Plotando variáveis suplementares
#plot(mca_res, choix = 'var', col.quali.sup = "steelblue4",
 #    col.quanti.sup = 'green4')


# Plot das variáveis
fviz_mca_var(mca_res, choice = "mca.cor", 
             repel = TRUE, # Avoid text overlapping (slow)
             ggtheme = theme_minimal(),
             ylim = c(0,1), xlim = c(0,1))


# Valores próprios e variância explicada - Mesmo que screeplot
print(mca_res$eig)

# Coordenadas das variáveis e indivíduos
print(mca_res$var$coord)
print(mca_res$ind$coord)


# Plot bonito do COS2
fviz_mca_var(mca_res, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE, # Avoid text overlappin
             gggtheme = theme_minimal())

# Gráfico variáveis suplementares quantitativas.
fviz_mca_var(mca_res, choice = "quanti.sup",
             ggtheme = theme_minimal())

# Cos2 of variable categories on Dim.1 and Dim.2
fviz_cos2(mca_res, choice = "var", axes = 1:2)


mca_res$call

