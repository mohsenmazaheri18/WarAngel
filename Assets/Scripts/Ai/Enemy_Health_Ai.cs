using UnityEngine;

public class Enemy_Health_Ai : MonoBehaviour
{
    public GameObject dead;
    public GameObject AIperson;


    public int count = 3;
    
    
    // Start is called before the first frame update
    void Start()
    {
       
    }
    

    public void TakeDamagePerson()
    {
        count -= 1;
        if (count<=0)
        {
            Instantiate(dead, AIperson.transform.position, AIperson.transform.rotation);
            Destroy(AIperson);
        }
    }
    public void TakeDamagePersonHead()
    {
        count -= 3;
        if (count<=0)
        {
            Instantiate(dead, AIperson.transform.position, AIperson.transform.rotation);
            Destroy(AIperson);
        }
    }
    


}
