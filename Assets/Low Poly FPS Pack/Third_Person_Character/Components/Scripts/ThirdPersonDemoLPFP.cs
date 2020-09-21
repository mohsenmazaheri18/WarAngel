using System.Collections;
using UnityEngine;
using UnityEngine.AI;

public class ThirdPersonDemoLPFP : MonoBehaviour
{
    [Header("patrol")] public float timepatrol;
    public float speedpatrol;
    public GameObject patrolpath;
    private float patining;
    private int numberpath = 0;
    private bool Ispatrol;
    public bool patroling;


    [Header("Nav")] NavMeshAgent agent;
    public GameObject player;
    public GameObject enemy;


    private Animator anim;



    [Header("Weapon Settings")] public bool semi;
    public bool auto;

    //Used for fire rate
    private float lastFired;

    //How fast the weapon fires, higher value means faster rate of fire
    [Tooltip("How fast the weapon fires, higher value means faster rate of fire.")]
    public float fireRate;

    [Header("Weapon Components")] public ParticleSystem muzzleflashParticles;
    public Light muzzleflashLight;

    [Header("Prefabs")] public Transform casingPrefab;
    public Transform bulletPrefab;
    public float bulletForce;
    public Transform grenadePrefab;
    public float grenadeSpawnDelay;

    [Header("Spawnpoints")] public Transform casingSpawnpoint;
    public Transform bulletSpawnpoint;
    public Transform grenadeSpawnpoint;

    [Header("Audio Clips")] public AudioClip shootSound;

    [Header("Audio Sources")] public AudioSource shootAudioSource;
    

    private void Start()
    {
        //Assign animator component
        anim = gameObject.GetComponent<Animator>();


        //Disable muzzleflash light at start
        muzzleflashLight.enabled = false;

        //navmesh
        agent = GetComponent<NavMeshAgent>();
        player = GameObject.FindGameObjectWithTag("Player");
    }

    public void Update()
    {

        if (patroling)
        {
            patrol();
        }
        else
        {
            Navigat();
        }
    }

    IEnumerator MuzzleflashLight()
    {
        muzzleflashLight.enabled = true;
        yield return new WaitForSeconds(0.02f);
        muzzleflashLight.enabled = false;

    }

    void patrol()
    {

        if (Vector3.Distance(transform.position, patrolpath.transform.GetChild(numberpath).position) <= 200f)
        {
            agent.speed = speedpatrol;
            agent.SetDestination(patrolpath.transform.GetChild(numberpath).position);
            anim.SetFloat("Vertical", 1.0f, 0, Time.deltaTime);
            anim.SetFloat("Horizontal", 0.0f, 0, Time.deltaTime);
            if (Vector3.Distance(transform.position, patrolpath.transform.GetChild(numberpath).position) <= 0.7f)
            {
                //idle
                agent.speed = 0f;
                patining += Time.deltaTime;
                anim.SetFloat("Vertical", 0.0f, 0, Time.deltaTime);
                anim.SetFloat("Horizontal", 0.0f, 0, Time.deltaTime);
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
    }

    void OnTriggerEnter(Collider col)
    {
        if (col.CompareTag("Player"))
        {
            Navigat();
            patroling = false;
        }

        if (col.CompareTag("bullet"))
        {
            Navigat();
            patroling = false;
        }

    }

    void OnTriggerExit(Collider cola)
    {
        Navigat();
        patroling = false;
    }

    public void Navigat()
    {
        patroling = false;
        //Ai Move
        if (Vector3.Distance(transform.position, player.transform.position) < 200)
        {
            //run
            agent.speed = 4f;
           anim.SetFloat("Vertical", 1.0f, 0, Time.deltaTime);
            anim.SetFloat("Horizontal", 0.0f, 0, Time.deltaTime);
            agent.SetDestination(player.transform.position);
            

            if (Vector3.Distance(transform.position, player.transform.position) < 8)
            {
                enemy.transform.rotation=Quaternion.Lerp(enemy.transform.rotation,Quaternion.LookRotation(player.transform.position - enemy.transform.position)
                    ,3f*Time.deltaTime);
                
                                   anim.SetFloat("Vertical", 0.5f, 0, Time.deltaTime);
                                   anim.SetFloat("Horizontal", 0.5f, 0, Time.deltaTime);
                if (Time.time - lastFired > 1 / fireRate)
                {
                    lastFired = Time.time;
                    //Play shoot sound
                    shootAudioSource.clip = shootSound;
                    shootAudioSource.Play();
                    //Play from second layer, from the beginning
                    anim.Play("Fire", 1, 0.0f);
                    //Play muzzleflash particles
                    muzzleflashParticles.Emit(1);
                    //Play light flash
                    StartCoroutine(MuzzleflashLight());

                    //Spawn casing at spawnpoint
                    Instantiate(casingPrefab,
                        casingSpawnpoint.transform.position,
                        casingSpawnpoint.transform.rotation);

                    //Spawn bullet from bullet spawnpoint
                    var bullet = (Transform) Instantiate(
                        bulletPrefab,
                        bulletSpawnpoint.transform.position,
                        bulletSpawnpoint.transform.rotation);
                    

                    //Add velocity to the bullet
                    bullet.gameObject.GetComponent<Rigidbody>().velocity =
                        bullet.transform.forward * bulletForce;
                    

                }

                agent.speed = 0f;
            }
        }
        patroling = false;
    }
    
    public void Patrolnakon()
    {
        patroling = false;
    }
    
}