library(ggplot2)

students_2016 <- data.frame(name = c('Sam', 'Will', 'Jess', 'Mark', 'Adrienne',
                                         'Maddie', 'Mili', 'Emily'),
                            gender = c('F', 'M', 'F', 'M', 'F',
                                       'F', 'F', 'F'),
                            stringsAsFactors = FALSE)

people <- data.frame(name = c('Sallie', 'Stephanie', 'Dave', 'Gizem', 'Vicki',
                              'Mark', 'Aaron',
                              'Josh', 'Emily', 'Bianica', 'Katie',
                              'Daniel',
                              'Tracie', 'Kim'),
                     gender = c('F', 'F', 'M', 'F', 'F',
                                'M', 'M',
                                'M', 'F', 'F', 'F',
                                'M',
                                'F', 'F'),
                     stringsAsFactors = FALSE)

visiting_scholars <- data.frame(name = c('William', 'Shane', 'Nozer', 'Lauren',
                                         'Victoria','Miron', 'Joy'),
                                gender = c('M', 'M', 'M', 'F', 'F', 'M', 'F'),
                                stringsAsFactors = FALSE)

students_2016$type = 'students'
people$type = 'people'
visiting_scholars$type = 'visiting'

lab <- rbind(students_2016, people, visiting_scholars)
lab

table(lab$gender)

table(lab[lab$type != 'visiting', 'gender', drop = FALSE])

table(lab[lab$type == 'students', 'gender', drop = FALSE])

bg_data <- lab[, 'gender', drop = FALSE]

ggplot(data = lab) +
    geom_bar(data = bg_data, aes(x = gender), fill = 'lightgrey', alpha = 0.5) +
    geom_bar(aes(x = gender, stat = 'identity', fill = type)) +
    facet_wrap(~type) +
    scale_fill_discrete(name = 'Type',
                        breaks=c("people", "students", "visiting"),
                        labels=c("Lab People", "Summer Students", "Visiting Scholars")) +
    theme_bw() +
    xlab('Gender') +
    ylab('Count') +
    ggtitle('Gender Counts in SDAL')

