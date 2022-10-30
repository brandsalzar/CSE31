#include<stdio.h>

int main()
{
int k = 1;
int avg_pos = 0, pos_sum = 0, pos_i = 0;
int avg_neg = 0, neg_sum = 0, neg_j = 0;

while (k!=0){
  printf("Please enter an integer:");
  scanf("%d", &k);

  if (k > 0) {
    pos_sum += k;
    pos_i++;
  }//end 1st if

  if (k < 0) {
    neg_sum += k;
    neg_j++;
  }//end second if

}//end while loop

if (neg_j != 0) {
avg_neg = (neg_sum/neg_j);
printf("Negative average:%d\n", avg_neg);
}
if (pos_i != 0) {
avg_pos = (pos_sum/pos_i);
printf("Positive average:%d\n", avg_pos);
}

return 0;
}//end main
