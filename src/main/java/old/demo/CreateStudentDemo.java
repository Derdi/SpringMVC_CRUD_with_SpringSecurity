package old.demo;

import old.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class CreateStudentDemo {

    public static void main(String[] args) {


        SessionFactory factory = new Configuration()
                                .configure("old/jdbc/hibernate.cfg.xml")
                                .addAnnotatedClass(Student.class)
                                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try{

            session.beginTransaction();

            List<Student> theStudents = session.createQuery("from Student").getResultList();

            for(Student s : theStudents)
                System.out.println(s);
            session.getTransaction().commit();

        }finally {
            factory.close();
        }
    }
}
