

#import "FTThreePageScrollView.h"
#import "FTZoomScrollView.h"
@implementation FTThreePageScrollView
@synthesize scrollView;
@synthesize dictionar;

-(void)dealloc{
    [dictionar release];
    [scrollView release];
    [prevPageView release];
    [currentPageView release];
    [nextPageView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    numberOfPages = [[dictionar allKeys] count];
    self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] autorelease];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    scrollView.contentSize = CGSizeMake(numberOfPages*scrollView.frame.size.width, scrollView.frame.size.height);
    
    scrollView.delegate = self;
    
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.bounces = NO;
    
    
    prevPageView = [[FTZoomScrollView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//    prevPageView.bouncesZoom = NO;
    currentPageView = [[FTZoomScrollView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//    currentPageView.bouncesZoom = NO;
    nextPageView = [[FTZoomScrollView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//    nextPageView.bouncesZoom = NO;
    
    [self addSubview:scrollView];
    [self setWithPageNumber:currentPage];
}
-(void)printDictionar{
   

}

-(void)setWithPageNumber:(NSInteger)pageNumber{
    

    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat pageHeight = self.scrollView.frame.size.height;
    currentPageView.frame = CGRectMake(pageWidth*currentPage, 0, pageWidth, pageHeight);

    [currentPageView setImage:[UIImage imageNamed:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage]]]];

    
    if (pageNumber == 0) {
        prevPageView.frame = CGRectZero;
        currentPageView.frame = CGRectMake(0, 0, pageWidth, pageHeight);
        nextPageView.frame = CGRectMake(pageWidth, 0, pageWidth, pageHeight);
        [nextPageView setImage:[UIImage imageNamed:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage+1]]]];
        
    }else if(currentPage == (numberOfPages - 1)){
        nextPageView.frame = CGRectZero;
        prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
        [prevPageView setImage:[UIImage imageNamed:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage-1]]]];
    }else{
        prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
        nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
        [prevPageView setImage:[UIImage imageNamed:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage-1]]]];
        [nextPageView setImage:[UIImage imageNamed:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage+1]]]];

    }

    
    [self.scrollView addSubview:currentPageView];
    [self.scrollView addSubview:prevPageView];
    [self.scrollView addSubview:nextPageView];
    

    

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = floor((self.scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
    

    
    if ((currentPage == page) || page < 0 || page > numberOfPages) {

        return;
    }else{
        NSInteger prevPage = currentPage;
        currentPage = page;
        self.scrollView.userInteractionEnabled = NO;
        
//        [self performSelector:@selector(refreshPageViewAfterPaged:) withObject:[NSNumber numberWithInteger:prevPage] afterDelay:0.1];
        [self performSelector:@selector(refreshPageViewAfterPaged:) withObject:[NSNumber numberWithInteger:prevPage]];
        checkDouble = NO;
    }

}


- (void)refreshPageViewAfterPaged:(NSNumber *)prevPageNumber{

    
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat pageHeight = self.scrollView.frame.size.height;

    NSInteger prevPage = [prevPageNumber integerValue];
    
    FTZoomScrollView *tempPageView = nil;
    currentPageView.zoomScale = 1;
    

    if (!checkDouble) {
        if (currentPage - 1 == prevPage) {
            tempPageView = currentPageView;
            currentPageView = nextPageView;
            nextPageView = prevPageView;
            prevPageView = tempPageView;
            
            prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
            currentPageView.frame = CGRectMake(currentPage * pageWidth, 0, pageWidth, pageHeight);
            
            if (currentPage == (numberOfPages - 1)) {
                nextPageView.frame = CGRectZero;
            }else{
                nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
                [self setWithPageNumber:currentPage];
            }
            
        }else if(currentPage + 1 == prevPage){
            tempPageView = currentPageView;
            currentPageView = prevPageView;
            prevPageView = nextPageView;
            nextPageView = tempPageView;
            
            currentPageView.frame = CGRectMake(currentPage * pageWidth, 0, pageWidth, pageHeight);
            nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
            
            if (currentPage == 0) {
                prevPageView.frame = CGRectZero;
            }else{
                prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
                
                [self setWithPageNumber:currentPage];
            }

            
        }
        checkDouble = YES;
    }
    
    self.scrollView.userInteractionEnabled = YES;
}



@end
