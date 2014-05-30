public class DoubleLL<E>{
    public class Node<E>{
	E data;
	Node<E> next,prev;
	public Node(E d) {
	    this.data = d;
	}
	public String toString() {
	    return ""+data;
	}

	public void setData(E d) { data = d; }
	public E getData() {return data; }

	public void setNext(Node<E> n){next = n;}
	public Node<E> getNext() {return next;}

	public void setPrev(Node<E> p){prev = p;}
	public Node<E> getPrev() {return prev;}
    }

    private Node<E> current;

    public void insert(E d) {
	Node<E> n = new Node<E>(d);
	if (current==null) {
	    current = n;
	}
	else {
	    n.setNext(current);
	    current.setPrev(n);
	    current = n;
	}
    }

    public E getCurrent(){
	return current.getData(); 
    }
    public void forward(){
	if (current.getNext() != null){current = current.getNext();}
    }
    public void back() {
	if (current.getPrev() != null){current = current.getPrev();}
    }
    
    public String toString() {
	if (current == null)
	    return "";
	Node<E> tmp = current;
	while (current.getPrev() != null)
	    tmp = tmp.getPrev();
	String s = "";
	while (tmp != null) {
	    s = s + tmp.getData() + "";
	    tmp = tmp.getNext();
	}
	return s;
    }
    
    public static void main(String[] args) {
	DoubleLL<String> L = new DoubleLL<String>();
	System.out.println(L);
	L.insert("hello");
	System.out.println(L);
	L.insert("world");
	System.out.println(L);
	L.insert("three");
	//first test up to here! 
     /* System.out.println(L.getCurrent());
	L.forward();
	System.out.println(L.getCurrent());
	L.insert("inserted");//inserts after current
	System.out.println(L); */
	//Then up to here

    }
}

