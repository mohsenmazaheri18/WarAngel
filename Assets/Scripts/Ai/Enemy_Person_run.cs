using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Enemy_Person_run : MonoBehaviour
{
    private NavMeshAgent nav;
    public GameObject player;
    
    [Header("patrol")] public float timepatrol;
    public float speedpatrol;
    public GameObject patrolpath;
    private float patining;
    private int numberpath = 0;
    private bool Ispatrol;
    
    public GameObject audio2;

    private Animator anim;
    // Start is called before the first frame update
    void Start()
    {
        nav = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();

    }

    // Update is called once per frame
    void Update()
    {
        navigat();
    }
    void patrol()
    {
        
        //walk
        nav.speed = speedpatrol;
        nav.SetDestination(patrolpath.transform.GetChild(numberpath).position);
        if (Vector3.Distance(transform.position, patrolpath.transform.GetChild(numberpath).position) <= 0.7f)
        {
            //idle
            nav.speed = 0f;
            patining += Time.deltaTime;
            if (patining >= timepatrol)
            {
                numberpath++;
                patining = 0f;
                
            }
        }

        if (numberpath >= patrolpath.transform.childCount)
        {
            numberpath = 0;
        }
    }

   public void navigat()
    {
        if (Vector3.Distance(transform.position,player.transform.position)<12f)
        { 
            anim.Play("Running");
            anim.SetBool("run",true);
          
            //nav.speed = speedpatrol;
            patrol();
            //nav.SetDestination(player.transform.position);
            print("shenakht");
            Destroy(audio2);
        }
    }
}
