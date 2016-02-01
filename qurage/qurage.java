import java.io.*;

class BigQurage{
    public int skin = 8;
    public int fang = 2;
    public int eye = 2;
}

class SmallQurage{
    public int skin = 2;
    public int fang = 10;
    public int eye = 2;
}

class QurageSword {
    public int skin = 5;
    public int fang = 6;
    public int eye = 2;
}

class CalqQurage {
    public static void main(String[] args) throws java.lang.Exception
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        BigQurage bigQurage = new BigQurage();
        SmallQurage smallQurage = new SmallQurage();
        QurageSword qurageSword = new QurageSword();
        int row_count = 0;
        int total_qurage_count = 0;
        int big_qurage_count = 0;
        int small_qurage_count = 0;
        
        try{
            
            while(true){
                String line = br.readLine();
                if(line == null || line.length() == 0) {
                    break;
                }
                if(row_count == 0) {
                    row_count++;
                    total_qurage_count = Integer.parseInt(line);
                } else if(row_count == 1 ){
                    row_count++;
                    for(int i = 0; i < total_qurage_count; i++) {
                        if( line.substring(i,i+1).equals("Q")) {
                            big_qurage_count++;
                        } else if(line.substring(i,i+1).equals("q")) {
                            small_qurage_count++;
                        }
                    }
                } else {
                    break;
                }
            }
        } finally {
            br.close();
        }
        int sword_skin = (int) (((bigQurage.skin * big_qurage_count) + (smallQurage.skin * small_qurage_count))/qurageSword.skin);
        int sword_fang = (int) (((bigQurage.fang * big_qurage_count) + (smallQurage.fang * small_qurage_count))/qurageSword.fang);
        int sword_eye  = (int) (((bigQurage.eye * big_qurage_count) + (smallQurage.eye * small_qurage_count))/qurageSword.eye);

        int min_sword = 0;
        if(sword_skin > sword_fang) {
            min_sword = sword_fang;
        }else{
            min_sword = sword_skin;
        }
        if(min_sword > sword_eye) {
            min_sword = sword_eye;
        }

        System.out.println(min_sword);
    }
}
