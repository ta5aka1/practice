import java.util.ArrayList;

public class BookShelf implements Aggregate
{
    private ArrayList<Book> books;
    
    public BookShelf() {
        books = new ArrayList<Book>();
        this.books = books;
    }
    
    public Book getBookAt(int index) {
        return books.get(index);
    }
    
    public void appendBook(Book book) {
        this.books.add(book);
    }
    
    public int getSize() {
        return this.books.size();
    }
    
    public Iterator iterator() {
        return new BookShelfIterator(this);
    }
}