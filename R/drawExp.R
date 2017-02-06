drawExp <- function(type=c("beneficial","harmful","drug"))
  {
    type <- match.arg(type)
    if (type=="drug") return(sample(c("Clorfinigrel","Zormaxifab","Dilanol","Pridor","Zorviva","Hospertab","Galginol"),1))
    else if (type=="beneficial")
      {
        action <- c("eat spinach","drink coffee","drink green tea","eat >20g fiber","exercise regularly","practice yoga")
        act <- c("eating spinach","drinking coffee","drinking green tea","eating >20g fiber","exercising regularly","practicing yoga")
      }
    else if (type=="harmful")
      {
        action <- c("are divorced","eat fast food once or more per week","reported high stress levels")
        act <- c("divorce","eating fast food once or more per week","stress")
      }
    i <- sample(1:length(act),1)
    return(list(action=action[i],act=act[i]))
  }
