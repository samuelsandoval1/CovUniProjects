import newspaper
from newspaper import Article

def get_headlines():

    URLs = ['http://www.foxnews.com/',
            'http://www.cnn.com/',
            'http://www.derspiegel.de/',
            'http://www.bbc.co.uk/',
            'https://theguardian.com',]

    for url in URLs:
        result = newspaper.build(url, memoize_articles=False)
        print('\n''The headlines from %s are' % url, '\n')
       
        for i in range(1,6):
            art = result.articles[i]
           # print("1\n")
            art.download()
         #   print("2\n")
            try:                                                          
                art.parse()                                                 # for when issue occurs during parse method
            except:                                                             # display exception if any 
                continue
         #   print("3\n")
            print(art.title)

if __name__ == '__main__':
    import timeit
    elapsed_time = timeit.timeit("get_headlines()", setup="from __main__ import get_headlines", number=2)/2             
    print(elapsed_time) 
