using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Enemy_UP_roof_Ai : MonoBehaviour
{

    //AI Navmesh
    NavMeshAgent agent;

    public GameObject player;
    public GameObject enemy;


    private Animator anim;

    public GameObject dead;



    [Header("Weapon Settings")]
    public bool semi;
    public bool auto;

    //Used for fire rate
    private float lastFired;
    //How fast the weapon fires, higher value means faster rate of fire
    [Tooltip("How fast the weapon fires, higher value means faster rate of fire.")]
    public float fireRate;

    [Header("Weapon Components")]
    public ParticleSystem muzzleflashParticles;
    public Light muzzleflashLight;

    [Header("Prefabs")]
    public Transform casingPrefab;
    public Transform bulletPrefab;
    public float bulletForce;
    public Transform grenadePrefab;
    public float grenadeSpawnDelay;

    [Header("Spawnpoints")]
    public Transform casingSpawnpoint;
    public Transform bulletSpawnpoint;
    public Transform grenadeSpawnpoint;

    [Header("Audio Clips")]
    public AudioClip shootSound;

    [Header("Audio Sources")]
    public AudioSource shootAudioSource;

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
        Nav();
    }
    IEnumerator MuzzleflashLight()
    {
        muzzleflashLight.enabled = true;
        yield return new WaitForSeconds(0.02f);
        muzzleflashLight.enabled = false;

    }

    public void Nav()
    {
        //Ai Move
        if (Vector3.Distance(transform.position, player.transform.position) < 100)
        {

            //Idle
            anim.SetFloat("Vertical", 0.0f, 0, Time.deltaTime);
            anim.SetFloat("Horizontal", 0.0f, 0, Time.deltaTime);

            agent.speed = 0f;
            agent.SetDestination(player.transform.position);

            if (Vector3.Distance(transform.position, player.transform.position) < 80)
            {
                enemy.transform.rotation = Quaternion.Lerp(enemy.transform.rotation, Quaternion.LookRotation(player.transform.position - enemy.transform.position), 3f * Time.deltaTime);

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
                    var bullet = (Transform)Instantiate(
                        bulletPrefab,
                        bulletSpawnpoint.transform.position,
                        bulletSpawnpoint.transform.rotation);

                    //Add velocity to the bullet
                    bullet.GetComponent<Rigidbody>().velocity =
                        bullet.transform.forward * bulletForce;


                }

                agent.speed = 0f;
            }
        }
    }
}