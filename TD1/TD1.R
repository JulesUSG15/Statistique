## Exercice 1:

# Lecture des données
ua.counts <- read.table("file:///Users/jules/Documents/Statistique/ua.counts", sep="", header=TRUE)
ua.counts

# Création du vecteur de données
ua.counts <- data.frame(
  UserAgent = c("Chromium", "Opera", "AppleWebKit", "IE", "Firefox", "Safari", "Chrome"),
  Count = c(56, 487, 858, 2306, 77539, 211459, 320422)
)
ua.counts

# Diagramme en barres
barplot(ua.counts$Count, names.arg=ua.counts$UserAgent, xlab="Navigateurs", ylab="Nombre d'utilisations")

# Camembert
pie(ua.counts$Count, labels=ua.counts$UserAgent)

## Exercice 2:

# Lecture du fichier
synop_lyon <- read.csv("file:///Users/jules/Documents/Statistique/synop-lyon.csv", header=TRUE, sep=",")

# Affichage des premières lignes
head(synop_lyon)

# Affichage des dernières lignes
tail(synop_lyon)

# Affichage de la structure des données
str(synop_lyon)

# Affichage du résumé statistique des données
summary(synop_lyon)

# Création de la colonne "annee"
synop_lyon$annee <- as.numeric(substr(synop_lyon$date, 1, 4))

# Affichage des premières lignes avec la nouvelle colonne
head(synop_lyon)

# Calcul des moyennes de températures par année
moyennes_temp <- aggregate(temperature ~ annee, synop_lyon, mean)

# Affichage des moyennes de températures
moyennes_temp

# Tracé de l'évolution des températures moyennes
plot(moyennes_temp$annee, moyennes_temp$temperature, type="l", xlab="Année", ylab="Température moyenne", main="Évolution des températures moyennes à Lyon")

# Régression linéaire
regression <- lm(temperature ~ annee, moyennes_temp)

# Tracé de la droite de régression
plot(moyennes_temp$annee, moyennes_temp$temperature, xlab="Année", ylab="Température", main="Régression linéaire des températures à Lyon")
abline(regression, col="red")

install.packages("tidyverse")
# Charger la bibliothèque tidyverse
library(tidyverse)

# Convertir la colonne "date" en format Date
data$date <- as.Date(data$date)

# Ajouter une colonne "saison" basée sur les mois
data <- data %>%
  mutate(saison = ifelse(month(date) %in% c(12, 1, 2), "Hiver", ifelse(month(date) %in% c(3, 4, 5), "Printemps", ifelse(month(date) %in% c(6, 7, 8), "Été", "Automne"))))

# Suppression des lignes avec des valeurs manquantes
data <- data[complete.cases(data),]

# Calculer la variation de la température pour chaque saison
result <- data %>%
  group_by(saison) %>%
  summarize(variation_temperature = max(temperature) - min(temperature))

# Afficher la variation de la température pour chaque saison
print(result)

# Lecture du fichier
synop_clermont <- read.csv("file:///Users/jules/Documents/Statistique/synop-clermont.csv", header=TRUE, sep=";")

# Affichage des premières lignes
head(synop_clermont)

# Affichage des dernières lignes
tail(synop_clermont)

# Affichage de la structure des données
str(synop_clermont)

# Affichage du résumé statistique des données
summary(synop_clermont)

# Création de la colonne "annee"
synop_clermont$annee <- as.numeric(substr(synop_clermont$Date, 1, 4))




## Exercice 3

# Lecture du fichier CSV
ping_data <- read.csv("file:///Users/jules/Documents/Statistique/test-ping.132.181.106.9.csv", header=TRUE)

# Affichage des premières lignes
head(ping_data)

# Affichage des dernières lignes
tail(ping_data)

# Affichage de la structure des données
str(ping_data)

# Affichage du résumé statistique des données
summary(ping_data)

# Résumé numérique des RTT
summary(ping_data$rtt)

# Tracé de la boîte à moustaches
boxplot(ping_data$rtt, main="Boîte à moustaches des rtt", ylab="rtt (ms)")

# Calculer la somme cumulative des RTT
cumulative_rtt <- ping_data$rtt

# Tracer le diagramme cumulatif
plot(cumulative_rtt, type = "o", xlab = "Jours de RTT", ylab = "Cumulatif RTT", main = "Diagramme Cumulatif des RTT")

# Tracé de l'histogramme
hist(ping_data$rtt, main="Histogramme des RTT", xlab="RTT (ms)", ylab="Fréquence")

# Suppression des lignes avec des valeurs manquantes
ping_data <- ping_data[complete.cases(ping_data),]

# Division des données en groupes
groups <- cut(ping_data$rtt, breaks=seq(0, 100, by=1))

# Tracé des histogrammes pour chaque groupe
for (group in unique(groups)) {
  if (sum(groups == group) > 100) {
    hist(ping_data$rtt[groups == group], main=paste("Histogramme des RTT (", group, ")", sep=""), xlab="RTT (ms)", ylab="Fréquence")
  }
}

# Exemple d'analyse ANOVA
result_anova <- aov(rtt ~ ttl, data = ping_data)
summary(result_anova)

# Exemple de graphique en boîte
boxplot(rtt~ ttl, data = ping_data, xlab = "TTL", ylab = "RTT", main = "Variation de RTT par TTL")

# Evolution du rtt au fil du temps
library(ggplot2)
ggplot(ping_data, aes(x = date, y = rtt)) +
  geom_line() +
  labs(x = "Date", y = "RTT") +
  ggtitle("Évolution du RTT au fil du temps")
