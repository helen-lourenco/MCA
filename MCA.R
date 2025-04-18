# Pacotes
install.packages("pacman")
pacman::p_load(dplyr, ggplot2, FactoMineR, factoextra)

# Dados
data(poison)

dim(poison) # 55 linhas e 15 colunas

head(poison)

# Tratamento
poison_sup <- poison # Variáveis suplementares: Age, Time, Sick e Sex
poison_mca <- poison %>% select(-c(1:4))

head(poison_mca)
summary(poison_mca)

# MCA
mca_res <- MCA(poison_mca, graph=F)

summary(mca_res)

fviz_mca(mca_res)

# Sem marcação dos indivíduos
fviz_mca_var(mca_res, 
             legend.title = "", 
             axes = c(1, 2))

# Apenas indivíduos
fviz_mca_ind(mca_res,
             axes = c(1, 2))

# Scree plot
fviz_screeplot(mca_res, 
               addlabels = TRUE, 
               ylim = c(0, 60))
