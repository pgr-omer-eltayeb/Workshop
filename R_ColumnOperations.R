# Step 1: Load Titanic Dataset
titanic_df <- read.csv("titanic.csv", header = TRUE, stringsAsFactors = FALSE)

# Step 2: Rename the 'name' column to 'FULL_NAME'
colnames(titanic_df)[colnames(titanic_df) == "name"] <- "FULL_NAME"

# Step 3: Remove passengers who did not survive (survived = 0)
titanic_df <- titanic_df[titanic_df$survived == 1, ]

# Step 4: Remove the 'sibsp' column
titanic_df <- titanic_df[, !(colnames(titanic_df) == "sibsp")]

# Step 5: Fill empty values in the 'cabin' column with 'NONE'
titanic_df$cabin[is.na(titanic_df$cabin)] <- "NONE"

# Step 6: Output the dataset to another file
write.csv(titanic_df, file = "titanic_modified.csv", row.names = FALSE)

cat("Modified dataset saved as 'titanic_modified.csv'\n")
